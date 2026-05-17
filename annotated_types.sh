package: annotated_types
description: annotated_types reusable type annotations for Python
version: "0.6.0"
tag: "0.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/annotated_types-0.6.0.tar.gz
requires:
  - Python
  - pip
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