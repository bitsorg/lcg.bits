package: itkwasm_downsample_wasi
description: itkwasm_downsample_wasi Python package
version: "1.5.0"
tag: "1.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/itkwasm_downsample_wasi-1.5.0.tar.gz
requires:
  - Python
  - pip
  - importlib_resources
  - itkwasm
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