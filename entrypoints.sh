package: entrypoints
description: entrypoints discover and load Python entry points
version: "0.4"
tag: "0.4"
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################