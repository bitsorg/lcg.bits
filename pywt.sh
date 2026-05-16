package: pywt
description: PyWavelets wavelet transforms for Python
version: "1.6.0"
tag: "1.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/PyWavelets-1.6.0.tar.gz
requires:
  - Python
  - setuptools
  - pillow
  - numpy
  - cython
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################