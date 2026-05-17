package: pypng
description: PyPNG pure Python PNG image read/write library
version: "0.20220715.0"
tag: "0.20220715.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pypng-0.20220715.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
patches:
  - pypng-0.20220715.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################