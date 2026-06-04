package: vbfnlo
description: VBFNLO NLO Monte Carlo generator for vector boson fusion and associated processes
version: "3.0"
tag: "3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tgz
requires:
  - GSL
  - lhapdf
  - looptools
  - feynhiggs
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  # Suppress the documentation build entirely.  doc/Manual.pdf is built with
  # LaTeX (needs cite.sty, which we neither ship nor need at runtime) and was the
  # only fatal failure; the libraries and the vbfnlo binary build fine.  Two
  # independent guards so docs are never built or installed, regardless of how
  # the doc subdir is wired into the generated Makefiles:
  #   1) drop 'doc' from the top-level (DIST_)SUBDIRS so the recursive `make` and
  #      `make install` (AutoToolsRecipe.MakeInstall) never descend into it;
  #   2) belt-and-braces: if doc is still reached (e.g. added via a conditional
  #      am__append rather than a literal SUBDIRS token), neutralise doc/Makefile
  #      so every recursive target there is a no-op.
  # (The old `make -C src/-C utilities` pre-builds were also wrong — they ran
  #  before lib/utilities existed, hence the spurious "No rule .../libVBFNLO.la"
  #  and missing .mod/.inc errors; a normal recursive build honours SUBDIRS order.)
  sed -i -E '/^(DIST_)?SUBDIRS[[:space:]]*=/ s/\bdoc\b//g' Makefile
  if [ -f doc/Makefile ]; then
    printf '%s\n\t%s\n' \
      'all install install-am install-exec install-data installcheck check clean distclean mostlyclean maintainer-clean dvi pdf ps html info tags ctags:' \
      '@:' > doc/Makefile
  fi
  make ${JOBS:+-j $JOBS}
}
function Configure() {
  # Touch the generated header so configure does not fail if it is missing
  cmake -E touch utilities/VBFNLOConfig.h.in 2>/dev/null || \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
    mkdir -p utilities && touch utilities/VBFNLOConfig.h.in
  ./configure --prefix="$INSTALLROOT" \
    ${GSL_ROOT:+--with-gsl="$GSL_ROOT"} \
    ${LHAPDF_ROOT:+--with-LHAPDF="$LHAPDF_ROOT"} \
    ${LOOPTOOLS_ROOT:+--with-LOOPTOOLS="$LOOPTOOLS_ROOT"} \
    "FCFLAGS=-std=legacy"
}
