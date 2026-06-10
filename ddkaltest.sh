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
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
function PostInstall() {
  # Upstream globs headers from ILD/include/*.h, but this version ships them under
  # include/DDKalTest/, so the glob installs nothing and DDKalTestConfig.cmake's
  # FIND_PATH fails -> consumers (marlintrk) miss DDKalTest. Install them manually.
  if [ -d "${SOURCEDIR}/include/DDKalTest" ]; then
    mkdir -p "${INSTALLROOT}/include/DDKalTest"
    cp -a "${SOURCEDIR}/include/DDKalTest/." "${INSTALLROOT}/include/DDKalTest/"
  fi
}
