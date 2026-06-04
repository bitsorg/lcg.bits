package: torchvision
description: torchvision datasets, model architectures and transforms for PyTorch
version: "0.22.1"
tag: "0.22.1"
requires:
  - torch
  - pillow
  - six
  - typing_extensions
  - requests
  - sympy
  - png
  - ninja
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################