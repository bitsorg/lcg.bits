package: funcsigs
description: funcsigs Python 3 function signatures backport
version: "1.0.2"
tag: "1.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/funcsigs-1.0.2.tar.gz
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