package: namex
description: namex Keras package API surface management
version: "0.0.8"
tag: "0.0.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/namex-0.0.8.tar.gz
requires:
  - Python
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