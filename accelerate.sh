package: accelerate
description: Hugging Face Accelerate library for distributed/mixed precision training
version: "1.3.0"
tag: "1.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/accelerate-1.3.0.tar.gz
requires:
  - Python
  - pip
  - numpy
  - packaging
  - psutil
  - PyYAML
  - torch
  # optional:
  # - transformers
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