package: cartopy
description: Cartopy geospatial data processing and map projections
version: "0.24.1"
tag: "0.24.1"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################