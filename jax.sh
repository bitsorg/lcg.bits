package: jax
description: JAX NumPy on accelerators with autograd and JIT (Google)
version: "0.9.2"
tag: "0.9.2"
requires:
  - Python
  - numpy
  - scipy
  - absl_py
  - opt_einsum
  - typing_extensions
  - jaxlib
  - importlib_metadata
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