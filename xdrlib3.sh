package: xdrlib3
description: xdrlib3 XDR data packing/unpacking for Python 3
version: "0.1.1"
tag: "0.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xdrlib3-0.1.1.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Python-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################