package: SFGen
description: SFGen exclusive B-meson decay Monte Carlo generator
version: "1.03.atlas2"
tag: "1.03.atlas2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/SFGen1.03.tar.gz
requires:
  - CMake
  - lhapdf
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-SFGen
# academic-use licence with no redistribution grant (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: false
patches:
  - SFGen-1.03.atlas2.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() { :; }
function Make() {
  # SFGen has no CMakeLists.txt; build with plain make, then install manually.
  # Outputs land in the build dir (after Prepare rsync), not SOURCEDIR.
  make ${JOBS:+-j $JOBS} FC=${FC:-gfortran}
  cmake -E copy_directory lib $INSTALLROOT/lib \
  && cmake -E copy_directory bin $INSTALLROOT/bin \
  && cmake -E copy_directory doc $INSTALLROOT/doc \
  && cmake -E copy_directory src $INSTALLROOT/src \
  && chmod -R go+r $INSTALLROOT/src \
  && chmod -R go+r $INSTALLROOT/bin/input.DAT
}
function MakeInstall() { :; }
