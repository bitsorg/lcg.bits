package: VTK
description: Visualization Toolkit (VTK) for 3D graphics and data visualization
version: "9.5.0"
source: https://gitlab.kitware.com/vtk/vtk
mem_per_job: 2048
mem_utilisation: 0.85
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
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
  - Qt5
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
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DVTK_GROUP_ENABLE_Qt=YES
}
