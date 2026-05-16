package: torchmetrics
description: TorchMetrics machine learning metrics for PyTorch
version: "1.7.2"
tag: "1.7.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/torchmetrics-1.7.2.tar.gz
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
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################