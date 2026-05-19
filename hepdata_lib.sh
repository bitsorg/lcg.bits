package: hepdata_lib
description: hepdata_lib library for preparing HEPData submissions
version: "0.20.0"
tag: "0.20.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hepdata_lib-0.20.0.tar.gz
requires:
  - Python
  - pip
  - hepdata_validator
  - PyYAML
  - scipy
  - ROOT
  - hist
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################