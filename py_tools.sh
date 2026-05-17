package: py_tools
description: py-tools collection of Python utility scripts
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pytools-unknown.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - appdirs
  - six
  - decorator
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