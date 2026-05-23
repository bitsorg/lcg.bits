package: textual
description: Textual TUI (text user interface) framework for Python
version: "0.74.0"
tag: "0.74.0"
requires:
  - Python
  - rich
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