package: protobuf
description: Google Protocol Buffers serialization library
version: "7.34.1"
source: https://github.com/protocolbuffers/protobuf
mem_per_job: 1500
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/protobuf-all-7.34.1.tar.gz
requires:
  - CMake
  - Python
  - absl
  - zlib
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
# Store-identity bump (2026-09-22): the stored protobuf artifact predates the
# self-relative .pc/.cmake relocation fix, and reuse does not re-relocate on
# overlay, so its pkg-config files kept dead INSTALLROOT paths (broke bear via
# grpc). The no-op below moves the recipe hash to force a corrected rebuild.
# Drop on the next store rebaseline.
: "bits-store-identity-2026-09-22"
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
