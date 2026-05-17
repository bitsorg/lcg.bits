package: pox
description: pox utilities for cross-platform path handling in Python
version: "0.2.5"
tag: "0.2.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pox-0.2.5.tar.gz
requires:
  - Python
  - setuptools
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