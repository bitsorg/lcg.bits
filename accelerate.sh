package: accelerate
description: Hugging Face Accelerate library for distributed/mixed precision training
version: "1.3.0"
tag: "1.3.0"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################