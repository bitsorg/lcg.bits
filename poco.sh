package: poco
description: POCO C++ portable networking and application framework
version: "1.14.1"
tag: "1.14.1"
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
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DPOCO_UNBUNDLED=ON \
    -DUTF8PROC_INCLUDE_DIR="${UTF8PROC_ROOT}/include" \
    -DUTF8PROC_LIBRARY="${UTF8PROC_ROOT}/lib/libutf8proc.so"
}
