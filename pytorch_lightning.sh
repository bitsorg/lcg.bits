package: pytorch_lightning
description: pytorch_lightning Python package
version: "2.5.1.post0"
tag: "2.5.1.post0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pytorch_lightning-2.5.1.post0.tar.gz
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################