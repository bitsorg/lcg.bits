package: torch_sparse
description: torch-sparse sparse matrix operations for PyTorch
version: "0.6.18"
tag: "0.6.18"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/torch_sparse-0.6.18.tar.gz
requires:
  - torch
  - scipy
  - sympy
  # optional:
  # - cuda
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