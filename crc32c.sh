package: crc32c
description: crc32c Python package
version: "2.7.1"
tag: "2.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/crc32c-2.7.1.tar.gz
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