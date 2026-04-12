package: loky
description: loky Python package
version: "3.5.6"
tag: "3.5.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/loky-3.5.6.tar.gz
requires:
  - Python
  - pip
  - cloudpickle
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