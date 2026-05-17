package: pytest_xdist
description: pytest-xdist pytest plugin for distributed testing
version: "3.8.0"
tag: "3.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pytest_xdist-3.8.0.tar.gz
requires:
  - Python
  - pip
  - pytest
  - execnet
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