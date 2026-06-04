package: pytest_runner
description: pytest-runner invoke pytest via setup.py test
version: "6.0.1"
tag: "6.0.1"
requires:
  - Python
  - setuptools_scm
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