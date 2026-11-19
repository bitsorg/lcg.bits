package: bleach
description: Bleach allowed-list-based HTML sanitization library
version: "6.4.0"
tag: "6.4.0"
requires:
  - Python
  - html5lib
  - six
  - packaging
  - webencodings
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################