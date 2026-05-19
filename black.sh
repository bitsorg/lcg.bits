package: black
description: Black uncompromising Python code formatter
version: "24.10.0"
tag: "24.10.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/black-24.10.0.tar.gz
requires:
  - Python
  - pip
  - click
  - mypy_extensions
  - packaging
  - pathspec
  - platformdirs
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