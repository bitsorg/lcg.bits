package: tcut_to_qastle
description: tcut_to_qastle Python package
version: "0.7"
tag: "0.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tcut_to_qastle-0.7.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - qastle
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