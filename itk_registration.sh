package: itk_registration
description: ITK image registration module
version: "5.4.0"
tag: "5.4.0"
requires:
  - Python
  - pip
  - itk_filtering
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