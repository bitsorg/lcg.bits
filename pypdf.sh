package: pypdf
description: pypdf pure-Python PDF library
version: "3.11.0"
tag: "3.11.0"
requires:
  - Python
  - typing_extensions
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################