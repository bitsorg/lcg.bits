package: ordered_set
description: ordered_set Python package
version: "4.1.0"
tag: "4.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ordered-set-4.1.0.tar.gz
requires:
  - Python
  - pip
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