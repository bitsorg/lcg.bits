package: berkeleydb
description: berkeleydb Python package
version: "18.1.15"
tag: "18.1.15"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/berkeleydb-18.1.15.tar.gz
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