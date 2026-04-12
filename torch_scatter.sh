package: torch_scatter
description: torch_scatter Python package
version: "2.1.2"
tag: "2.1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/torch_scatter-2.1.2.tar.gz
requires:
  - torch
  - sympy
  # optional:
  # - cuda
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################