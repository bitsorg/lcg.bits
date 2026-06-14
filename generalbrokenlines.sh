package: generalbrokenlines
description: General Broken Lines track fit library
version: "04.00.03"
tag: "04.00.03"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - eigen
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
function Configure() {
  # The CMake project lives in the cpp/ subdirectory, not the tarball root
  # (mirrors lcgcmake: cmake <SOURCE_DIR>/cpp -DSUPPORT_ROOT=ON).
  cmake "${SOURCEDIR}/cpp" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DSUPPORT_ROOT=ON \
    -DBUILD_TESTING=OFF
}
