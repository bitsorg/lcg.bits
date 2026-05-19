package: flake8
description: Flake8 Python code style, lint and complexity checker
version: "7.3.0"
tag: "7.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/flake8-7.3.0.tar.gz
requires:
  - Python
  - entrypoints
  - pyflakes
  - pycodestyle
  - mccabe
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