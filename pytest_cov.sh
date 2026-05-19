package: pytest_cov
description: pytest-cov coverage plugin for pytest
version: "7.0.0"
tag: "7.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pytest_cov-7.0.0.tar.gz
requires:
  - Python
  - pytest
  - coverage
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