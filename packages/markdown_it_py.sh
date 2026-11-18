package: markdown_it_py
description: markdown-it-py Markdown parser in Python
version: "2.2.0"
tag: "2.2.0"
requires:
  - Python
  - mdurl
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