package: nanobind
description: nanobind lightweight C++/Python binding library
version: "2.10.2"
tag: "2.10.2"
requires:
  - Python
  - CMake
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