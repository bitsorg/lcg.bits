package: mpmath
description: mpmath Python library for arbitrary-precision arithmetic
version: "1.3.0"
tag: "1.3.0"
requires:
  - Python
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