package: VTK
description: Visualization Toolkit (VTK) for 3D graphics and data visualization
version: "9.5.0"
tag: "9.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/VTK-9.5.0.tar.gz
requires:
  - CMake
  - libxml2
  - glib
  - expat
  - utf8cpp
  - zlib
  - png
  - eigen
  - tiff
  - jpeg
  - double_conversion
  - lz4
  - hdf5
  - netcdfc
  - proj
  - gl2ps
  - jsonmcpp
  - jsoncpp
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
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
    -DCMAKE_C_COMPILER="" \
    -DCMAKE_CXX_COMPILER="" \
    -DVTK_GROUP_ENABLE_Qt=YES
}
