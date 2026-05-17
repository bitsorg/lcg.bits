package: jax_cuda12_pjrt
description: JAX CUDA 12 PJRT plugin
version: "unknown"
tag: "unknown"
requires:
  - Python
  - pip
  - numpy
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