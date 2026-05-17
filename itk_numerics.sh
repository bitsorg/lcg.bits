package: itk_numerics
description: ITK numerical methods module
version: "5.4.0"
tag: "5.4.0"
requires:
  - Python
  - pip
  - itk_core
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################