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
  # Remove C++17-incompatible explicit template args from DynArray constructor
  # (tinyxml2.h has CRLF line endings, so avoid patch files; sed matches fine)
  sed -i 's/DynArray< T, INIT >()/DynArray()/g' include/tinyxml2.h
  # Point lhapdf-config via LHAPDF_HOME, add Boost include, pass CXXFLAGS,
  # add Boost lib path, and add -fPIE for Fortran objects
  sed -i 's/-DDROP_CGAL/-DDROP_CGAL $(CXXFLAGS)/' src/Makefile
  sed -i 's|lhapdf-config --incdir|$(LHAPDF_HOME)/bin/lhapdf-config --incdir) -I$(BOOST_INCLUDE|' src/Makefile
  sed -i 's|lhapdf-config --ldflags)|lhapdf-config --ldflags) -L$(BOOST_HOME)/lib|' src/Makefile
  sed -i 's|gfortran -c alfas_functions|gfortran -fPIE -c alfas_functions|' src/Makefile
}
function Make() {
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
