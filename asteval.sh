package: asteval
description: asteval Python package
version: "0.9.31"
tag: "0.9.31"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/asteval-0.9.31.tar.gz
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