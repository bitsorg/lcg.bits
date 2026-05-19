package: recola
description: RECOLA recursive one-loop amplitude generator
version: "2.2.4.atlas1"
tag: "2.2.4.atlas1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/recola2-2.2.4.tar.gz
requires:
  - CMake
  - collier
  - recola_SM
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
patches:
  - recola-2.2.4.atlas1.patch
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
      -DCMAKE_BUILD_TYPE=Release \
    -Dcollier_path=${collier_ROOT}/lib \
    -Dmodel=SM \
    -Dmodelfile_path=${recola_SM_ROOT}/lib/cmake \
    -Dwith_python3=ON \
    -Dstatic=OFF \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
}
