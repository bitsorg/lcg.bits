package: charset_normalizer
description: charset-normalizer alternative to chardet for encoding detection
version: "3.4.0"
tag: "3.4.0"
requires:
  - Python
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