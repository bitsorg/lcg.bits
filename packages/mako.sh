package: mako
description: Mako fast Python template library
version: "1.4.2"
tag: "1.4.2"
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