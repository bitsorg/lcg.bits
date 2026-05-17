package: pure_eval
description: pure_eval safely evaluate Python expressions without side-effects
version: "0.2.3"
tag: "0.2.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pure_eval-0.2.3.tar.gz
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