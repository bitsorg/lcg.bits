package: cartopy
description: Cartopy geospatial data processing and map projections
version: "0.24.1"
tag: "0.24.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Cartopy-0.24.1.tar.gz
requires:
  - numpy
  - cython
  - geos
  - shapely
  - proj
  - six
  - pyshp
  - pyproj
  - matplotlib
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################