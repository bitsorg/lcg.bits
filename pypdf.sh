package: pypdf
description: pypdf pure-Python PDF library
version: "3.11.0"
tag: "3.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pypdf-3.11.0.tar.gz
requires:
  - Python
  - pip
  - typing_extensions
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