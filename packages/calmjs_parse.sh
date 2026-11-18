package: calmjs_parse
description: calmjs.parse ECMAScript parser for Python
version: "1.3.4"
tag: "1.3.4"
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
