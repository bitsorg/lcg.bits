package: typeguard
description: typeguard runtime type checking for Python
version: "2.13.3"
tag: "2.13.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/typeguard-2.13.3.tar.gz
requires:
  - setuptools_scm
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