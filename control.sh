package: control
description: Python Control Systems Library
version: "0.9.1"
tag: "0.9.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/control-0.9.1.tar.gz
requires:
  - Python
  - numpy
  - scipy
  - matplotlib
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