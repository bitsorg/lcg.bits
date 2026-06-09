package: epos4
description: EPOS4 hadronic interaction and heavy-ion event generator
version: "4.0.3.atlas1"
tag: "4.0.3.atlas1"
sources:
  # Upstream tarball is named for the base version (4.0.3); the ".atlas1" suffix
  # is only the LCG version label, not part of the filename.  In lcgcmake this
  # comes from "author=4.0.3" in the epos4 package declaration, giving
  # epos<author>.tgz = epos4.0.3.tgz.
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/epos4.0.3.tgz
requires:
  - CMake
  - ROOT
  - fastjet
  - hepmc3
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-EPOS4
patches:
  - epos4-4.0.3.atlas1.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # EPOS4's CMake applies its Fortran flag set (FORTRAN_COMPILE_FLAGS: -cpp,
  # -std=legacy, -mcmodel=large, -fno-automatic, ...) to the TP/UR/HQ targets via
  # target_compile_options, but NOT to the KW target (src/KW only gets -D__ROOT__
  # added to the list, never applied). So KW's huge legacy file src/KW/bas.f
  # compiles WITHOUT -cpp: its `#include "ems.h"` / `#if __TP__` are never
  # preprocessed, leaving parameters like kollmx undefined ("Automatic object ...
  # cannot appear in COMMON", "Variable 'kollmx' cannot appear in the
  # expression"), and without -std=legacy/-mcmodel=large. Inject the full set via
  # CMAKE_Fortran_FLAGS, which DOES reach every Fortran target (KW included). Also
  # add -fallow-argument-mismatch for the legacy REAL(8)/REAL(4) call mismatches
  # (gfortran >= 10 errors on these; the project never adds it). Modules that
  # already get these flags just receive them twice, which is harmless.
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_Fortran_FLAGS="-fallow-argument-mismatch -cpp -std=legacy -fno-automatic -mcmodel=large" \
    -DCOMPILE_OPTION=BASIC \
    -DCOMPILE_LIBRARY=ON \
    -DFASTSYS="${FASTJET_ROOT}" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
}
function PostInstall() {
  # Copy data files (excluding source and build artefacts)
  rsync -a \
    --exclude='**/CMakeModules' \
    --exclude=CMakeLists.txt \
    --exclude='**/.git' \
    --exclude='*.h' \
    --exclude='*.c' \
    --exclude='*.cpp' \
    --exclude='*.f' \
    "$SOURCEDIR"/ "$INSTALLROOT"/
  # Extend modulefile with EPOS4 runtime environment
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv EPOS4_ROOT $PKG_ROOT
setenv EPO4VSN 4.0.3
# Final slash is required by EPOS, please leave it be
setenv EPO4 $PKG_ROOT/
prepend-path PATH $::env(EPO4)bin
setenv OPT ./
setenv HTO ./
setenv CHK ./
EOF
}
