package: jax_cuda12_pjrt
description: jax_cuda12_pjrt Python package
version: "unknown"
tag: "unknown"
requires:
  - Python
  - pip
  - numpy
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