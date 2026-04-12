package: colorcet
description: colorcet Python package
version: "3.1.0"
tag: "3.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/colorcet-3.1.0.tar.gz
requires:
  - Python
  - setuptools
  - pyct
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