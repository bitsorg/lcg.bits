package: func_adl_servicex
description: func_adl_servicex ServiceX backend for func_adl
version: "2.1"
tag: "2.1"
requires:
  - Python
  - func_adl
  - qastle
  - servicex
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