package: safetensors
description: safetensors simple, safe format for storing tensors
version: "0.7.0"
tag: "0.7.0"
requires:
  - Python
  # optional:
  # - tensorflow
  # - torch
  # - numpy
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
