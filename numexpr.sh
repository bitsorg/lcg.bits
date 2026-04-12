package: numexpr
description: numexpr Python package
version: "2.10.1"
tag: "2.10.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/numexpr-2.10.1.tar.gz
requires:
  - Python
  - numpy
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