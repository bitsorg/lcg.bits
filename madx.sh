package: madx
description: MAD-X accelerator optics design and tracking code
version: "5.09.00"
tag: "5.09.00"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - zlib
  - blas
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
acknowledgment: "CERN Copyright - MIT License."
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    `# Build for the native macOS arch. The old hardcoded x86_64 fails on Apple` \
    `# Silicon: the Fortran compiler targets arm64, so CMake aborts on the` \
    `# CMAKE_OSX_ARCHITECTURES mismatch. uname -m -> arm64 (AS) / x86_64 (Intel);` \
    `# ignored by CMake on Linux.` \
    -DCMAKE_OSX_ARCHITECTURES="$(uname -m)" \
    -DMADX_ONLINE=OFF \
    -DMADX_INSTALL_DOC=OFF
}
