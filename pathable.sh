package: pathable
description: pathable tree-like data structure traversal by path
version: "0.4.4"
tag: "0.4.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pathable-0.4.4.tar.gz
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