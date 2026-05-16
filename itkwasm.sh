package: itkwasm
description: ITK WebAssembly bindings
version: "1.0b185"
tag: "1.0b185"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/itkwasm-1.0b185.tar.gz
requires:
  - Python
  - pip
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