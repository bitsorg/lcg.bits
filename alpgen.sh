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
  # Auto-detect whether the tarball has a single top-level prefix directory.
  local prefix
  prefix=$(tar tzf "${tgz}" | head -1 | cut -d/ -f1)
  if tar tzf "${tgz}" | grep -q "^${prefix}/"; then
    tar xzf "${tgz}" --strip-components=1
  else
    tar xzf "${tgz}"
  fi
  rm -f "${tgz}"

  # alpgen.f: ctime() returns 26 chars but declared as char*24; use a literal.
  find . -name alpgen.f -exec sed -i \
    -e "s/      character\*24 CTIME,now/      character\*25 now/" \
    -e "s/^c      now='Day Mon XX hh:mm:ss yyyy'/      now='Day Mon XX hh:mm:ss yyyy'/" \
    -e "s/^      now=ctime(time())/c      now=ctime(time())/" \
    {} \;
  # alputi.f: same char*24 NOW → char*25 (two subroutine variants)
  find . -name alputi.f -exec sed -i \
    -e 's/CHARACTER TITLE\*25,BOOK\*3,NOW\*24/CHARACTER TITLE*25,BOOK*3,NOW*25/' \
    -e 's/CHARACTER TITLE\*25,BOOK\*3,SCALE\*3,NOW\*24/CHARACTER TITLE*25,BOOK*3,SCALE*3,NOW*25/' \
    {} \;
}

function Make() {
  # Use the Makefile's default target; 'all' is not defined in this package.
  make ${JOBS:+-j $JOBS}
}
