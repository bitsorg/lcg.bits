package: optree
description: optree optimised PyTree utilities for JAX/PyTorch
version: "0.14.1"
tag: "0.14.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/optree-0.14.1.tar.gz
requires:
  - Python
  - typing_extensions
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################