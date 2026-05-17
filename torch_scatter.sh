package: torch_scatter
description: torch-scatter segment-based reduction operations
version: "2.1.2"
tag: "2.1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/torch_scatter-2.1.2.tar.gz
requires:
  - torch
  - sympy
  # optional:
  # - cuda
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