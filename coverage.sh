package: coverage
description: coverage.py code coverage measurement for Python
version: "7.13.5"
tag: "7.13.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/coverage-7.13.5.tar.gz
requires:
  - Python
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