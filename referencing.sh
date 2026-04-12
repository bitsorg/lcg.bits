package: referencing
description: referencing Python package
version: "0.35.1"
tag: "0.35.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/referencing-0.35.1.tar.gz
requires:
  - Python
  - pip
  - rpds_py
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