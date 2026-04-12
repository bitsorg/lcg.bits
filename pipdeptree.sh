package: pipdeptree
description: pipdeptree Python package
version: "2.9.0"
tag: "2.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pipdeptree-2.9.0.tar.gz
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