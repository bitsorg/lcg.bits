package: itk_io
description: ITK image I/O module
version: "5.4.0"
tag: "5.4.0"
requires:
  - Python
  - pip
  - itk_core
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################