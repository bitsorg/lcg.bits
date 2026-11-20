package: hist
description: Hist powerful histogramming based on boost-histogram
version: "2.10.1"
tag: "2.10.1"
requires:
  - Python
  - hatchling
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################