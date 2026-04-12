package: hydjet++
description: hydjet++ Monte Carlo event generator
version: "2.1"
tag: "2.1"
requires:
  - ROOT
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ${EXEC} PATH=${ROOT_ROOT}/bin:$PATH make ${JOBS:+-j $JOBS} -j2 F77LIBSO=${FORTRAN_LIBRARY}
  cmake -E make_directory $INSTALLROOT/bin $INSTALLROOT/share COMMAND cmake
}