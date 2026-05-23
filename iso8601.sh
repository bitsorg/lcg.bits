package: iso8601
description: iso8601 simple ISO 8601 date/time parser for Python
version: "1.0.2"
tag: "1.0.2"
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
