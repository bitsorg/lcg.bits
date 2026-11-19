package: google_pasta
description: google-pasta Python source code transformation library
version: "0.2.0"
tag: "0.2.0"
requires:
  - Python
  - six
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