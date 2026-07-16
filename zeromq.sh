package: zeromq
license: MPL-2.0
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
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD"                          \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -G Ninja                            \
      -DENABLE_WS=OFF                     \
      -DBUILD_TESTS=OFF                   \
      -DCMAKE_INSTALL_LIBDIR=lib          \
      -DCMAKE_INSTALL_PREFIX=$INSTALLROOT
}
function Make() {
   # Build in the binary dir, not cwd: the out-of-source build tree (build.ninja)
   # lives under $BITS_CMAKE_BUILD, while cwd is the source copy.
   ninja -C "$BITS_CMAKE_BUILD" ${JOBS+-j $JOBS} install
}

function MakeInstall() {
   true
}

