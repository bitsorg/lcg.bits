package: pyflakes
description: pyflakes passive checker for Python programs
version: "3.4.0"
tag: "3.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyflakes-3.4.0.tar.gz
requires:
  - Python
  - setuptools
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