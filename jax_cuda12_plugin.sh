package: jax_cuda12_plugin
description: jax_cuda12_plugin Python package
version: "unknown"
tag: "unknown"
requires:
  - Python
  - pip
  - jax_cuda12_pjrt
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