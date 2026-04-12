package: jaxlib
description: jaxlib Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################