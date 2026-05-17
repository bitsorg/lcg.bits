package: lark
description: Lark modern parsing library for Python
version: "1.1.5"
tag: "1.1.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lark-1.1.5.tar.gz
requires:
  - Python
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