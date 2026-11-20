package: ddkaltest
description: DDKalTest Kalman-filter track fit for DD4hep geometry
version: "01.07.01"
tag: "v01-07-01"
source: https://github.com/iLCSoft/DDKalTest.git
requires:
  - CMake
  - ilcutil
  - ROOT
  - DD4hep
  - LCIO
  - GSL
  - kaltest
  - aidatt
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
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
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
function PostInstall() {
  # Upstream's header-install glob (ILD/include/*.h) matches nothing here (headers
  # live under include/DDKalTest/), so no headers install and consumers fail with
  # "Could NOT find DDKalTest". Install them where the config actually looks.
  if [ -d "${SOURCEDIR}/include/DDKalTest" ]; then
    mkdir -p "${INSTALLROOT}/include/DDKalTest"
    cp -a "${SOURCEDIR}/include/DDKalTest/." "${INSTALLROOT}/include/DDKalTest/"
  fi
}
