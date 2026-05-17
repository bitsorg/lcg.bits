package: pymadx
description: pyMADX Python wrapper for MAD-X
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pymadx-unknown.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - matplotlib
  - importlib_metadata
  - tabulate
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################