package: proj
description: PROJ cartographic projections and coordinate transformations
version: "9.6.0"
tag: "9.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - tiff
  - sqlite
  - pkg_config
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: CMake searches *.framework first by default, so FindSQLite3 picked up
  # an ancient SQLite (3.7.13) bundled in /Library/Frameworks/Mono.framework
  # instead of the real one, failing proj's "SQLite3 >= 3.11 required" check.
  # Search frameworks last so the SDK/bits sqlite3 is found. No effect on Linux.
  _find_fw=""
  bits_is_macos && _find_fw="-DCMAKE_FIND_FRAMEWORK=LAST"
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    ${_find_fw} \
    -DBUILD_SHARED_LIBS=ON
}
