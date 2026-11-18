package: pytest_xdist
description: pytest-xdist pytest plugin for distributed testing
version: "3.8.0"
tag: "3.8.0"
requires:
  - Python
  - pytest
  - execnet
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