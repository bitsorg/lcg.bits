package: pywt
description: PyWavelets wavelet transforms for Python
version: "1.6.0"
tag: "1.6.0"
requires:
  - Python
  - pillow
  - numpy
  - cython
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
PYPI_NAME="PyWavelets"
##############################
MODULE_OPTIONS="--bin --python"
##############################
