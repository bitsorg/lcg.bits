package: itk_meshtopolydata
description: ITK mesh-to-polydata conversion module
version: "0.11.0"
tag: "0.11.0"
requires:
  - Python
  - pip
  - numpy
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