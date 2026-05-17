package: asttokens
description: asttokens annotates Python AST nodes with source code positions
version: "2.4.1"
tag: "2.4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/asttokens-2.4.1.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - six
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