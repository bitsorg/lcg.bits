package: ced
description: CED (CEDViewer Event Display) for ILC experiments
version: "01.10"
tag: "v01-10"
source: https://github.com/iLCSoft/CED.git
requires:
  - CMake
  - ilcutil
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
    -DBUILD_TESTING=ON \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
function MakeInstall() {
  # ilcutil's GENERATE_PACKAGE_CONFIGURATION_FILES emits CEDLibDeps.cmake via the
  # legacy export_library_dependencies() command, which is a NO-OP in CMake 3.30
  # (policy CMP0033), so the file is never generated — yet the generated install
  # rule and CEDConfig.cmake's INCLUDE both reference it. Provide an empty stub
  # (legacy per-target link-dependency tracking, unused by modern target-based
  # find_package) so install and downstream find_package(CED) succeed.
  : > "$BITS_CMAKE_BUILD/CEDLibDeps.cmake"
  cmake --install "$BITS_CMAKE_BUILD"
}
