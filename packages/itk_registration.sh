package: itk_registration
description: ITK image registration module
version: "5.4.0"
tag: "5.4.0"
requires:
  - Python
  - itk_filtering
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