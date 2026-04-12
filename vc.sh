package: Vc
description: Vc library/tool (from LCG software stack)
version: "1.4.5"
tag: "1.4.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Vc-1.4.5.tar.gz
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
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=${CMAKE_C_WRAPPER} \
    -DCMAKE_C_FLAGS=${CMAKE_C_FLAGS} \
    -DCMAKE_CXX_COMPILER=${CMAKE_CXX_WRAPPER} \
    -DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}
}
