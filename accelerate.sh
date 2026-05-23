package: accelerate
description: Hugging Face Accelerate library for distributed/mixed precision training
version: "1.3.0"
tag: "1.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - numpy
  - packaging
  - psutil
  - PyYAML
  - torch
  # optional:
  # - transformers
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