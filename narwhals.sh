package: narwhals
description: narwhals lightweight dataframe compatibility layer
version: "1.9.4"
tag: "1.9.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/narwhals-1.9.4.tar.gz
requires:
  - Python
  - pip
  - executing
  - pure_eval
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