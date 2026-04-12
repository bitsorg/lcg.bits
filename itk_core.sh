package: itk_core
description: itk_core Python package
version: "5.4.0"
tag: "5.4.0"
requires:
  - Python
  - pip
  - numpy
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