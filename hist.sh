package: hist
description: hist Python package
version: "2.10.1"
tag: "2.10.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hist-2.10.1.tar.gz
requires:
  - Python
  - pip
  - boost_histogram
  - histoprint
  - numpy
  - more_itertools
  - matplotlib
  - scipy
  - iminuit
  - mplhep
  - dask
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