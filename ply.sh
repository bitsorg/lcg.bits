package: ply
description: PLY Python Lex-Yacc parser tools
version: "3.11"
tag: "3.11"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ply-3.11.tar.gz
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