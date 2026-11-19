package: scikit_build_core
description: scikit-build-core PEP 517 build backend for CMake-based Python packages
version: "0.11.4"
tag: "0.11.4"
requires:
  - Python
  - packaging
  - pyproject_metadata
  - tomli
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
