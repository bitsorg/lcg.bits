package: mako
description: Mako fast Python template library
version: "1.3.5"
tag: "1.3.5"
requires:
  - Python
  - MarkupSafe
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