package: wasmtime
description: wasmtime Python package
version: "40.0.0"
tag: "40.0.0"
requires:
  - Python
  - pip
  - cffi
  - importlib_resources
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