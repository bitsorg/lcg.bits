package: py
description: py library with cross-python path and file utilities
version: "1.11.0"
tag: "1.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/py-1.11.0.tar.gz
requires:
  - Python
  - setuptools_scm
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