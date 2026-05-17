package: PyJWT
description: PyJWT JSON Web Token implementation for Python
version: "2.0.1"
tag: "2.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/PyJWT-2.0.1.tar.gz
requires:
  - setuptools
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