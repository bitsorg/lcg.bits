package: importlib_resources
description: importlib_resources backport of importlib.resources
version: "6.5.2"
tag: "6.5.2"
requires:
  - Python
  - zipp
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