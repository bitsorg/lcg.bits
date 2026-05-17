package: tinycss2
description: tinycss2 low-level CSS parser for Python
version: "1.2.1"
tag: "1.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tinycss2-1.2.1.tar.gz
requires:
  - Python
  - pip
  - webencodings
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