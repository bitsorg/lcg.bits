package: shapely
description: Shapely geometric objects manipulation for Python
version: "2.0.5"
tag: "2.0.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Shapely-2.0.5.tar.gz
requires:
  - Python
  - setuptools
  - geos
  - cython
  - numpy
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
patches:
  - shapely-2.0.5.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################