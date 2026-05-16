package: types_pyyaml
description: types-PyYAML type stubs for PyYAML
version: "6.0.12.20241230"
tag: "6.0.12.20241230"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/types_PyYAML-6.0.12.20241230.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################