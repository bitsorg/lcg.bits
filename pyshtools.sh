package: pyshtools
description: pyshtools spherical harmonic analysis and synthesis
version: "4.14.1"
tag: "4.14.1"
requires:
  - Python
  - proj
  - geos
  - xarray
  - pooch
  - astropy
  - matplotlib
  - numpy
  - requests
  - scipy
  - tqdm
  - fftw
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
