package: beautifulsoup4
description: Beautiful Soup HTML/XML parsing library for Python
version: "4.10.0"
tag: "4.10.0"
requires:
  - Python
  - soupsieve
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