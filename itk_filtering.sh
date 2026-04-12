package: itk_filtering
description: itk_filtering Python package
version: "5.4.0"
tag: "5.4.0"
requires:
  - Python
  - pip
  - itk_numerics
  - itk_core
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################