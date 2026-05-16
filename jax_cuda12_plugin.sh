package: jax_cuda12_plugin
description: JAX CUDA 12 XLA plugin
version: "unknown"
tag: "unknown"
requires:
  - Python
  - pip
  - jax_cuda12_pjrt
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