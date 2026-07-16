package: poco
description: POCO C++ portable networking and application framework
version: "1.14.1"
source: https://github.com/pocoproject/poco
tag: "poco-%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - zlib
  - expat
  - sqlite
  - pcre2
  - utf8proc
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSL-1.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # The unbundled utf8proc library has a platform-specific suffix: .so on Linux,
  # .dylib on macOS. Hardcoding .so makes make fail on macOS ("No rule to make
  # target .../libutf8proc.so").
  local shlib=so; bits_is_macos && shlib=dylib
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DPOCO_UNBUNDLED=ON \
    -DUTF8PROC_INCLUDE_DIR="${UTF8PROC_ROOT}/include" \
    -DUTF8PROC_LIBRARY="${UTF8PROC_ROOT}/lib/libutf8proc.${shlib}"
}
