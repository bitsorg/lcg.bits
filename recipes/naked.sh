package: naked
description: Naked Python framework and tools for CLI application development
version: "0.1.32"
tag: "0.1.32"
requires:
  - Python
  - PyYAML
  - requests
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