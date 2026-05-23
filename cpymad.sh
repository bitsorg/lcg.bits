package: cpymad
description: cpymad Python bindings to MAD-X
version: "1.19.0"
tag: "1.19.0"
requires:
  - Python
  - cython
  - numpy
  - minrpc
  - madx
  - importlib_resources
  - zipp
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-MAD-X
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################