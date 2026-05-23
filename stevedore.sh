package: stevedore
description: stevedore manage dynamic plugins for Python
version: "3.3.0"
tag: "3.3.0"
requires:
  - Python
  - pbr
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