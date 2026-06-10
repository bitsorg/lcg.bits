package: kokkos
description: Kokkos performance portability programming model
version: "4.7.01"
tag: "4.7.01"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - hwloc
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: Apple clang ships no OpenMP runtime, so find_package(OpenMP) fails;
  # use the C++ Threads backend (std::thread, no libomp) instead.
  _kokkos_host="-DKokkos_ENABLE_OPENMP=ON"
  bits_is_macos && _kokkos_host="-DKokkos_ENABLE_OPENMP=OFF -DKokkos_ENABLE_THREADS=ON"
  cmake "${SOURCEDIR}" \
    -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DKokkos_ENABLE_SERIAL=ON \
    ${_kokkos_host}
}
