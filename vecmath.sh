package: vecmath
description: vecmath library/tool (from LCG software stack)
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/VecMath-HEAD.tar.gz
requires:
  - veccore
  - vdt
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
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -G \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER="" \
    -DCMAKE_C_FLAGS=$CFLAGS \
    -DCMAKE_CXX_COMPILER="" \
    -DCMAKE_CXX_FLAGS=$CXXFLAGS
}
