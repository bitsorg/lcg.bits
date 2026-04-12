package: avro
description: avro Python package
version: "1.12.0"
tag: "1.12.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/avro-1.12.0.tar.gz
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