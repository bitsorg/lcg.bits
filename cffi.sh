package: cffi
description: CFFI C Foreign Function Interface for Python
version: "2.0.0"
tag: "2.0.0"
requires:
  - Python
  - pycparser
  - libffi
  - pkg_config
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
