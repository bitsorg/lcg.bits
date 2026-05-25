package: superchic
description: SuperChic Monte Carlo generator for central exclusive processes
version: "4.02.2"
tag: "4.02.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/superchic-v4.02.tar.gz
requires:
  - apfel
  - lhapdf
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-SuperChic
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  # superchic v4 uses a plain Fortran makefile with hardcoded LHAPDFLIB and
  # optional APFEL paths.  Override both; clear APFEL link flags since apfel
  # is not a required dependency.  Setting APFELLIB to LHAPDF_ROOT/lib avoids
  # a bare -L flag in the link command when the variable is empty.
  mkdir -p bin
  make ${JOBS:+-j $JOBS} \
    LHAPDFLIB="${LHAPDF_ROOT}/lib" \
    APFELLIB="${APFEL_ROOT}/lib" \
    LIBFLAGapfel="-lAPFEL -lAPFELevol" \
    ${FC:+FC="$FC"}
}
function MakeInstall() {
  install -d "$INSTALLROOT/bin" "$INSTALLROOT/lib"
  install -m 755 bin/init bin/superchic "$INSTALLROOT/bin/"
  install -m 644 lib/libsuperchic.so lib/libsuperchic.a "$INSTALLROOT/lib/"
}
