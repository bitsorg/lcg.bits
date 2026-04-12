package: dotmap
description: dotmap Python package
version: "1.3.30"
tag: "1.3.30"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dotmap-1.3.30.tar.gz
requires:
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