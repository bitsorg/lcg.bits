package: torchmetrics
description: TorchMetrics machine learning metrics for PyTorch
version: "1.7.2"
tag: "1.7.2"
requires:
  - numpy
  - packaging
  - typing_extensions
  - lightning_utilities
  - scikitlearn
  # optional:
  # - torch
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################