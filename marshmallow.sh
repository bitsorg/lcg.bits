package: marshmallow
description: marshmallow object serialization and deserialization library
version: "3.16.0"
tag: "3.16.0"
requires:
  - Python
  - packaging
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