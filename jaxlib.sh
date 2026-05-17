package: jaxlib
description: jaxlib compiled XLA-based backend for JAX
version: "${jax_native_version}"
tag: "${jax_native_version}"
requires:
  - Python
  - pip
  - flatbuffers
  - scipy
  - numpy
  - absl_py
  - six
  - ml_dtypes
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