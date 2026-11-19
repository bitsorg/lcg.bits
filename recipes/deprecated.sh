package: deprecated
description: Deprecated Python @deprecated decorator
version: "1.2.13"
tag: "1.2.13"
requires:
  - Python
  - wrapt
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