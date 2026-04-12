package: itkwasm_downsample
description: itkwasm_downsample Python package
version: "1.4.3"
tag: "1.4.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/itkwasm_downsample-1.4.3.tar.gz
requires:
  - Python
  - pip
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