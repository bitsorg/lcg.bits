package: pycparser
description: pycparser complete C99 parser in pure Python
version: "2.22"
tag: "2.22"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pycparser-2.22.tar.gz
requires:
  - Python
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
