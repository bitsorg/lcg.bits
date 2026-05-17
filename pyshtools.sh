package: pyshtools
description: pyshtools spherical harmonic analysis and synthesis
version: "4.13.1"
tag: "4.13.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyshtools-4.13.1.tar.gz
requires:
  - Python
  - setuptools
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
  - pip
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