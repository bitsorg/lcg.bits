package: tensorboardX
description: TensorboardX TensorBoard writer for PyTorch
version: "2.6.2.2"
tag: "2.6.2.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tensorboardX-2.6.2.2.tar.gz
requires:
  - pip
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################