package: pytorch_lightning
description: PyTorch Lightning lightweight PyTorch wrapper
version: "2.5.1.post0"
tag: "2.5.1.post0"
requires:
  - numpy
  - tqdm
  - PyYAML
  - fsspec
  - torchmetrics
  - packaging
  - typing_extensions
  - lightning_utilities
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