package: namex
description: namex Python package
version: "0.0.8"
tag: "0.0.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/namex-0.0.8.tar.gz
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