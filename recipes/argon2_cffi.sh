package: argon2_cffi
description: argon2-cffi Argon2 password hashing Python bindings
version: "23.1.0"
tag: "23.1.0"
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