package: pyproject_metadata
description: pyproject_metadata - metadata reader/writer for Python's pyproject.toml
version: "0.11.0"
tag: "0.11.0"
requires:
  - Python
  - pip
  - packaging
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
# Rebuild trigger: ensure this is built with corrected PythonPipRecipe
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
