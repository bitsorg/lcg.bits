package: tinydb
description: tinydb Python package
version: "4.8.2"
tag: "4.8.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tinydb-4.8.2.tar.gz
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