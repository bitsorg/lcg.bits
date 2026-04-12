package: notebook_shim
description: notebook_shim Python package
version: "0.2.4"
tag: "0.2.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/notebook_shim-0.2.4.tar.gz
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