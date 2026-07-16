package: vbfnlo
description: VBFNLO NLO Monte Carlo generator for vector boson fusion and associated processes
version: "3.0"
source: https://github.com/vbfnlo/vbfnlo.git
tag: "v%(version)s"
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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  # Suppress the LaTeX doc build (needs cite.sty, not shipped/needed): drop 'doc'
  # from (DIST_)SUBDIRS, and neutralise doc/Makefile in case it's reached via a
  # conditional am__append. The libraries and the vbfnlo binary build fine.
  perl -i -pe 's/\bdoc\b//g if /^(DIST_)?SUBDIRS[[:space:]]*=/' Makefile
  if [ -f doc/Makefile ]; then
    printf '%s\n\t%s\n' \
      'all install install-am install-exec install-data installcheck check clean distclean mostlyclean maintainer-clean dvi pdf ps html info tags ctags:' \
      '@:' > doc/Makefile
  fi
  # macOS: the VBFNLO shared libraries cross-reference each other's Fortran
  # routines, resolved at load time; the two-level namespace rejects undefined
  # symbols at link, so allow them (dynamic_lookup) as Linux's flat namespace does.
  bits_patch_libtool_undefined
  make ${JOBS:+-j $JOBS}
}
function Configure() {
  # Touch the generated header so configure does not fail if it is missing
  cmake -E touch utilities/VBFNLOConfig.h.in 2>/dev/null || \
    mkdir -p utilities && touch utilities/VBFNLOConfig.h.in
  ./configure --prefix="$INSTALLROOT" \
    ${GSL_ROOT:+--with-gsl="$GSL_ROOT"} \
    ${LHAPDF_ROOT:+--with-LHAPDF="$LHAPDF_ROOT"} \
    ${LOOPTOOLS_ROOT:+--with-LOOPTOOLS="$LOOPTOOLS_ROOT"} \
    "FCFLAGS=-std=legacy"
}
