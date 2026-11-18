package: tensorboardX
description: TensorboardX TensorBoard writer for PyTorch
version: "2.6.2.2"
tag: "2.6.2.2"
requires:
  - numpy
  - protobuf
  - packaging
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################