package: igprof
description: IgProf performance and memory profiler
version: "5.9.18"
tag: "5.9.18"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - libunwind
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
patches:
  - igprof-5.9.18.patch
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
    -DCMAKE_CXX_STANDARD=14 \
    -DUNWIND_INCLUDE_DIR:PATH=${LIBUNWIND_ROOT}/include \
    -DUNWIND_LIBRARY:FILEPATH=${LIBUNWIND_ROOT}/lib/libunwind.so \
    -DCMAKE_CXX_FLAGS="-Wno-error=unused-result -Wno-error=deprecated-declarations"
}
