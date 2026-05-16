package: jax
description: JAX NumPy on accelerators with autograd and JIT (Google)
version: "0.9.2"
tag: "0.9.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jax-0.9.2.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - scipy
  - absl_py
  - opt_einsum
  - typing_extensions
  - jaxlib
  - importlib_metadata
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