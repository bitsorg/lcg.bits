package: overrides
description: overrides @override decorator for Python methods
version: "7.7.0"
tag: "7.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/overrides-7.7.0.tar.gz
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