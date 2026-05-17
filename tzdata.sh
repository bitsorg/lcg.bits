package: tzdata
description: tzdata IANA timezone data distribution for Python
version: "2024.1"
tag: "2024.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tzdata-2024.1.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################