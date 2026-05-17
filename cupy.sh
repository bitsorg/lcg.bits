package: cupy
description: CuPy NumPy-compatible array library for NVIDIA GPUs
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cupy-unknown.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - six
  - fastrlock
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################