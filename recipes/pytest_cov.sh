package: pytest_cov
description: pytest-cov coverage plugin for pytest
version: "7.0.0"
tag: "7.0.0"
requires:
  - Python
  - pytest
  - coverage
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