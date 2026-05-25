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
  # NOTE: src/Makefile already ships with the LHAPDF_HOME/Boost/fPIE fixes
  # applied in the tarball; do NOT re-apply them or the paths double up.
  sed -i 's/DynArray< T, INIT >()/DynArray()/g' include/tinyxml2.h
}
function Make() {
  # LIBS in src/Makefile uses bare 'lhapdf-config --ldflags'; ensure it is
  # findable without requiring the LHAPDF module to be loaded on the build host.
  export PATH="${LHAPDF_ROOT:+$LHAPDF_ROOT/bin:}$PATH"
  make -C src ${JOBS:+-j $JOBS} all \
    LHAPDF_HOME=${LHAPDF_ROOT} \
    BOOST_INCLUDE=${Boost_home_include} \
    BOOST_HOME=${Boost_ROOT} \
    CXXFLAGS=""
}
function MakeInstall() {
  cmake -E make_directory "$INSTALLROOT/bin"
  cmake -E copy sys_calc "$INSTALLROOT/bin/sys_calc"
}
