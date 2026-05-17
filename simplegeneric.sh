package: simplegeneric
description: simplegeneric simple generic functions for Python
version: "0.8.1"
tag: "0.8.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/simplegeneric-0.8.1.zip
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: ZPL-2.1
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################