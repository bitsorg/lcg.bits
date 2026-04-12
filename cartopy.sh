package: cartopy
description: cartopy Python package
version: "0.24.1"
tag: "0.24.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Cartopy-0.24.1.tar.gz
requires:
  - setuptools
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################