package: flake8_bugbear
description: flake8_bugbear Python package
version: "25.10.21"
tag: "25.10.21"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/flake8_bugbear-25.10.21.tar.gz
requires:
  - Python
  - flake8
  - attrs
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