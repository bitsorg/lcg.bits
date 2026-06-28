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
  # CMake 3.30 removed export_library_dependencies() (policy CMP0033). ilcutil's
  # GENERATE_PACKAGE_CONFIGURATION_FILES macro calls it to emit <PKG>LibDeps.cmake,
  # so under modern CMake the file is silently never generated — and every consumer
  # then fails: the generated install rule and <PKG>Config.cmake's INCLUDE both
  # reference the missing file. Replace that call with a FILE(WRITE) stub so the
  # file always exists (legacy per-target link-dependency tracking, unused by
  # modern target-based find_package). One central fix for every ilcsoft consumer
  # (ced, raida, marlin*, gear, kaltest, …) instead of ~30 per-recipe workarounds.
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
