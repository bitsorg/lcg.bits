package: strip_hints
description: strip-hints remove Python type hints from source code
version: "0.1.13"
tag: "0.1.13"
requires:
  - Python
  - six
  - wheel
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