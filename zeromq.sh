package: zeromq
description: ZeroMQ high-performance asynchronous messaging library
version: "4.3.5"
tag: "4.3.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - "GCC-Toolchain:(?!osx)"
build_requires:
  - "CMake"
  - ninja
  - bits-recipe-tools
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake --pkgconfig"
##############################
function Configure() {
  cmake $SOURCEDIR                          \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -G Ninja                            \
      -DENABLE_WS=OFF                     \
      -DBUILD_TESTS=OFF                   \
      -DCMAKE_INSTALL_LIBDIR=lib          \
      -DCMAKE_INSTALL_PREFIX=$INSTALLROOT
}
function Make() {
   ninja ${JOBS+-j $JOBS} install
}

function MakeInstall() {
   true
}

