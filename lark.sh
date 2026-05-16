package: lark
description: Lark modern parsing library for Python
version: "1.1.5"
tag: "1.1.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lark-1.1.5.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################