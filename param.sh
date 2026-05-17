package: param
description: Param declarative data classes with parameter typing
version: "1.13.0"
tag: "1.13.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/param-1.13.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################