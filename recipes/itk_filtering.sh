package: itk_filtering
description: ITK image filtering module
version: "5.4.0"
tag: "5.4.0"
requires:
  - Python
  - itk_numerics
  - itk_core
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