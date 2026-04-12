package: torch_cluster
description: torch_cluster Python package
version: "1.6.3p1"
tag: "1.6.3p1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/torch_cluster-1.6.3p1.tar.gz
requires:
  - Python
  - torch
  - sympy
  - scipy
  # optional:
  # - cuda
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - torch_cluster-1.6.3p1.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################