package: Frontier_Client
description: Frontier conditions/calibration data access client
version: "2.10.2"
tag: "2.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/frontier_client__2.10.2__src.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - Frontier_Client-2.10.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  $SHELL -c "sed -i 's#EXPAT_DIR}/lib#EXPAT_DIR}/lib64#g'  $SOURCEDIR/Makefile"
  make ${JOBS:+-j $JOBS} -j1 dist PACPARSER_DIR=${pacparser_ROOT} EXPAT_DIR=${expat_ROOT} ${opt_Frontier_Client} ${library_path}=${expat_ROOT}/${LIBDIR_DEFAULT}:$ENV{${library_path}}
  cmake -E copy_directory $SOURCEDIR/dist $INSTALLROOT
}