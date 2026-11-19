package: asyncache
description: asyncache cache helper for async functions
version: "0.3.1"
tag: "0.3.1"
requires:
  - Python
  - cachetools
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