package: safetensors
description: safetensors simple, safe format for storing tensors
version: "0.7.0"
tag: "0.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/safetensors-0.7.0.tar.gz
requires:
  - Python
  - pip
  # optional:
  # - tensorflow
  # - torch
  # - numpy
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