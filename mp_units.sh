package: mp_units
description: mp-units compile-time C++ units of measurement library
version: "2.5.0"                                                                                                               
tag: "v2.5.0"                                                                                                                   
source: https://github.com/mpusz/mp-units.git
requires:
  - CMake
  - cppgsl
  - fmt
  - Catch2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
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
    -DMP_UNITS_API_CONTRACTS=MS-GSL \
    -DBUILD_TESTING=OFF
}
function Make() {
  # Build only library targets; runtime tests fail on GCC 15 due to
  # ambiguity between fmt::format_to and std::format_to (mp_units 2.5.0 bug)
  cmake --build . --target mp-units-core --target mp-units-systems ${JOBS:+-- -j$JOBS}
}
