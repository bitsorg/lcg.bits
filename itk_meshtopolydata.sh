package: itk_meshtopolydata
description: itk_meshtopolydata Python package
version: "0.11.0"
tag: "0.11.0"
requires:
  - Python
  - pip
  - numpy
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