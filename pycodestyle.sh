package: pycodestyle
description: pycodestyle Python style guide checker (PEP 8)
version: "2.14.0"
tag: "2.14.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pycodestyle-2.14.0.tar.gz
requires:
  - Python
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