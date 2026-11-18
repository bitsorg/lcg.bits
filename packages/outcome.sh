package: outcome
description: outcome Pythonic implementation of a Result type
version: "1.3.0"
tag: "1.3.0"
requires:
  - Python
  - attrs
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT OR Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################