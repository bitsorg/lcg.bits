package: pandoramonitoring
description: PandoraMonitoring ROOT-based visualization for Pandora
version: "03.06.00"
source: https://github.com/PandoraPFA/PandoraMonitoring
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - ROOT
  - pandorasdk
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
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
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_MODULE_PATH="${PANDORAPFA_ROOT}/cmakemodules" \
    -DCMAKE_CXX_FLAGS="-Wno-error"
  # Legacy export_library_dependencies() writes <PKG>LibDeps.cmake in cmake's working
  # dir (the source copy), but the install rule expects it in the binary dir; move it.
  cp "$BITS_CMAKE_SRC"/*LibDeps.cmake "$BITS_CMAKE_BUILD"/ 2>/dev/null || true
}
