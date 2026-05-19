package: HeapDict
description: HeapDict heap-based priority queue for Python
version: "1.0.1"
tag: "1.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/HeapDict-1.0.1.tar.gz
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