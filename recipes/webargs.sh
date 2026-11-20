package: webargs
description: webargs declarative request parsing and validation library
version: "8.4.0"
tag: "8.4.0"
requires:
  - Python
  - marshmallow
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