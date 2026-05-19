package: numcodecs
description: numcodecs buffer compression and transformation codecs
version: "0.16.0"
tag: "0.16.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/numcodecs-0.16.0.tar.gz
requires:
  - Python
  - pip
  - cython
  - numpy
  - entrypoints
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
patches:
  - numcodecs-0.16.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################