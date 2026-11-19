package: ilcutil
description: ILCUtil utility library for ILC software packages
version: "01.09"
tag: "v01-09"
source: https://github.com/iLCSoft/ilcutil.git
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Prepare() {
  rsync -a --delete --exclude '/bits-build/' "$SOURCEDIR"/ ./
  # CMake 3.30 removed export_library_dependencies() (CMP0033), which ilcutil calls
  # to emit <PKG>LibDeps.cmake; without it every consumer's install rule/Config.cmake
  # fails. Replace with a FILE(WRITE) stub - one central fix for all ilcsoft consumers.
  sed -i 's|EXPORT_LIBRARY_DEPENDENCIES([^)]*)|FILE( WRITE "${PROJECT_BINARY_DIR}/${arg}" "# stub: export_library_dependencies removed in CMake 3 (CMP0033)" )|' \
    cmakemodules/MacroGeneratePackageConfigFiles.cmake
}
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
