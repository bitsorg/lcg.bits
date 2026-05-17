package: pycuda
description: PyCUDA CUDA integration for Python
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pycuda-unknown.tar.gz
requires:
  - Python
  - setuptools
  - appdirs
  - decorator
  - mako
  - pytest
  - py_tools
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