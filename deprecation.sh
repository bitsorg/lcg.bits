package: deprecation
description: deprecation library for marking deprecated code
version: "2.1.0"
tag: "2.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/deprecation-2.1.0.tar.gz
requires:
  - Python
  - setuptools
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