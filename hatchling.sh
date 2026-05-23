package: hatchling
description: Hatchling extensible PEP 517 build backend
version: "1.28.0"
tag: "1.28.0"
requires:
  - Python
  - pluggy
  - tomli
  - pathspec
  - trove_classifiers
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