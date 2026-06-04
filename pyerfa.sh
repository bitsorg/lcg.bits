package: pyerfa
description: pyERFA Python bindings for ERFA astronomical library
version: "2.0.1.4"
tag: "2.0.1.4"
requires:
  - Python
  - numpy
  - setuptools_scm
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