package: optree
description: optree Python package
version: "0.14.1"
tag: "0.14.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/optree-0.14.1.tar.gz
requires:
  - Python
  - pip
  - typing_extensions
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