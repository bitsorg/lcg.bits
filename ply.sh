package: ply
description: ply Python package
version: "3.11"
tag: "3.11"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ply-3.11.tar.gz
requires:
  - Python
  - setuptools
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