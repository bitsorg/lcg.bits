package: simplegeneric
description: simplegeneric Python package
version: "0.8.1"
tag: "0.8.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/simplegeneric-0.8.1.zip
requires:
  - Python
  - setuptools
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