package: mdit_py_plugins
description: mdit-py-plugins collection of plugins for markdown-it-py
version: "0.4.0"
tag: "0.4.0"
requires:
  - Python
  - markdown_it_py
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