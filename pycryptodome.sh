package: pycryptodome
description: PyCryptodome standalone Python cryptography library
version: "3.21.0"
tag: "3.21.0"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause AND Public Domain
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################