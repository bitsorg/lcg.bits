package: syscalc
description: SysCalc tool for computing PDF and scale uncertainties
version: "1.1.7"
tag: "1.1.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/sysCalc-1.1.7.tar.gz
requires:
  - CMake
  - lhapdf
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-SysCalc
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() { :; }
function Prepare() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # Remove C++17-incompatible explicit template args from DynArray constructor.
  # tinyxml2.h has CRLF line endings so we use sed rather than a patch file.
  sed -i 's/DynArray< T, INIT >()/DynArray()/g' include/tinyxml2.h
  # Add -fPIE to the gfortran rule so alfas_functions.o is position-independent.
  sed -i 's|gfortran -c alfas_functions|gfortran -fPIE -c alfas_functions|' src/Makefile
}
function Make() {
  # Override INCLUDES and LIBS on the make command line so the Makefile's
  # $(shell lhapdf-config ...) expansions never run — those can produce a bare
  # -I that consumes the hardcoded -c flag, turning compiles into link steps.
  local _inc="-I../include${LHAPDF_ROOT:+ -I${LHAPDF_ROOT}/include}"
  local _libs="${LHAPDF_ROOT:+$("${LHAPDF_ROOT}/bin/lhapdf-config" --ldflags)}"
  make -C src ${JOBS:+-j $JOBS} all \
    "INCLUDES=${_inc}" \
    "LIBS=${_libs}" \
    ${FC:+FC="$FC"}
}
function MakeInstall() {
  cmake -E make_directory "$INSTALLROOT/bin"
  cmake -E copy sys_calc "$INSTALLROOT/bin/sys_calc"
}
