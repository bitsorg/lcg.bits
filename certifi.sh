package: certifi
description: Certifi Mozilla CA bundle for Python
version: "2024.8.30"
tag: "2024.8.30"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/certifi-2024.8.30.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MPL-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################