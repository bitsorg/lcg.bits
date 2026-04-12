package: colored
description: colored Python package
version: "2.2.3"
tag: "2.2.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/colored-2.2.3.tar.gz
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