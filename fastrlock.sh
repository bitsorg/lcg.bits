package: fastrlock
description: fastrlock fast recursive lock implementation for Cython
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fastrlock-unknown.tar.gz
requires:
  - Python
  - setuptools
  - cython
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################