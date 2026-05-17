package: xyzservices
description: xyzservices repository of XYZ tile service providers
version: "2023.5.0"
tag: "2023.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xyzservices-2023.5.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################