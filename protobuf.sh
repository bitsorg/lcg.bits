package: protobuf
description: Google Protocol Buffers serialization library
version: "5.28.3"
source: https://github.com/protocolbuffers/protobuf
mem_per_job: 1500
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/protobuf-all-5.28.3.tar.gz
requires:
  - CMake
  - Python
  - absl
  - zlib
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
patches:
  - protobuf-5.28.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -Dprotobuf_BUILD_SHARED_LIBS=OFF \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -Dprotobuf_BUILD_TESTS=OFF \
    -DCMAKE_CXX_STANDARD=17 \
    -DABSL_PROPAGATE_CXX_STD=ON \
    -Dprotobuf_ABSL_PROVIDER=package \
    -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=ON \
    ${ABSL_ROOT:+-Dabsl_ROOT="$ABSL_ROOT"}
}
