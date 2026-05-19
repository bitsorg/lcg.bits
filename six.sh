package: six
description: six Python 2 and 3 compatibility utilities
version: "1.17.0"
tag: "1.17.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/six-1.17.0.tar.gz
requires:
  - Python
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
