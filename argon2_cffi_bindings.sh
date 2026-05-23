package: argon2_cffi_bindings
description: argon2-cffi-bindings low-level Argon2 CFFI bindings
version: "21.2.0"
tag: "21.2.0"
requires:
  - Python
  - cffi
  - six
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