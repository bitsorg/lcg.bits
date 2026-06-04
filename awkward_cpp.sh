package: awkward_cpp
description: awkward-cpp compiled components for Awkward Array
version: "52"
tag: "52"
requires:
  - numpy
  - pytest_runner
  - PyYAML
  - arrow
  - scikit_build_core
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################