package: donfig
description: Donfig easy configuration for Python packages
version: "0.8.1.post1"
tag: "0.8.1.post1"
requires:
  - Python
  - PyYAML
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