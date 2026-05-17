package: hist
description: Hist powerful histogramming based on boost-histogram
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
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################