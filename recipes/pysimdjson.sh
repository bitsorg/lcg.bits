package: pysimdjson
description: pysimdjson Python bindings for simdjson JSON library
version: "7.0.1"
tag: "7.0.1"
requires:
  - Python
  - pybind11
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################