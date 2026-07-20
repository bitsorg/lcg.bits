package: alpgen
description: ALPGEN leading-order multi-parton matrix-element event generator
version: "2.1.4"
tag: "2.1.4"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-Alpgen
# academic-use licence with no redistribution grant (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: none
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Prepare() {
  local tgz="alpgen_v214.tgz"
  curl -fSL "https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/${tgz}" -o "${tgz}"
  # Strip a wrapping dir only if the tarball has exactly one top-level entry.
  # (The old head -1 heuristic was order-dependent and mis-stripped under macOS
  # bsdtar, flattening ALPGEN's many top-level dirs and dropping compile.mk.)
  local ntop
  ntop=$(tar tzf "${tgz}" | sed -e 's#/.*##' | sort -u | grep -c .)
  if [ "${ntop}" -eq 1 ]; then
    tar xzf "${tgz}" --strip-components=1
  else
    tar xzf "${tgz}"
  fi
  rm -f "${tgz}"

  # alpgen.f: ctime() returns 26 chars but declared as char*24; use a literal.
  find . -name alpgen.f -exec perl -i -pe \
    "s/      character\*24 CTIME,now/      character\*25 now/; s/^c      now='Day Mon XX hh:mm:ss yyyy'/      now='Day Mon XX hh:mm:ss yyyy'/; s/^      now=ctime(time())/c      now=ctime(time())/" \
    {} \;
  # alputi.f: same char*24 NOW → char*25 (two subroutine variants)
  find . -name alputi.f -exec perl -i -pe \
    's/CHARACTER TITLE\*25,BOOK\*3,NOW\*24/CHARACTER TITLE*25,BOOK*3,NOW*25/; s/CHARACTER TITLE\*25,BOOK\*3,SCALE\*3,NOW\*24/CHARACTER TITLE*25,BOOK*3,SCALE*3,NOW*25/' \
    {} \;
}

function Make() {
  # Use the Makefile's default target; 'all' is not defined in this package.
  make ${JOBS:+-j $JOBS}
}

function MakeInstall() {
  true;
}
