package: html5lib
description: html5lib Python HTML5 parser
version: "1.1"
tag: "1.1"
requires:
  - Python
  - webencodings
  - six
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
