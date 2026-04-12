package: catboost
description: catboost Python package
version: "1.2"
tag: "1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/catboost-1.2.tar.gz
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