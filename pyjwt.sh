package: PyJWT
description: PyJWT JSON Web Token implementation for Python
version: "2.8.0"
tag: "2.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/PyJWT-2.8.0.tar.gz
requires:
  - Python
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