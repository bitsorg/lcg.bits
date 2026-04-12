package: overrides
description: overrides Python package
version: "7.7.0"
tag: "7.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/overrides-7.7.0.tar.gz
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