package: gperftools
description: gperftools library/tool (from LCG software stack)
version: "2.18.1"
tag: "2.18.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gperftools-2.18.1.tar.gz
requires:
  - libunwind
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_COMPILER=$CXX \
    -DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS} \
    -DCMAKE_CXX_STANDARD=17 \
    -Dgperftools_enable_frame_pointers=ON \
    -Dgperftools_enable_libunwind=ON \
    -Dgperftools_enable_large_alloc_report=ON
}
