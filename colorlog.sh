package: colorlog
description: colorlog Python package
version: "6.7.0"
tag: "6.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/colorlog-6.7.0.tar.gz
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