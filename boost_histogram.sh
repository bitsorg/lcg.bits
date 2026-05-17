package: boost_histogram
description: boost-histogram fast C++ backed Python histogramming
version: "1.7.1"
tag: "1.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/boost_histogram-1.7.1.tar.gz
requires:
  - Python
  - pip
  - numpy
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