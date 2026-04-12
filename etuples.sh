package: etuples
description: etuples Python package
version: "0.3.9"
tag: "0.3.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/etuples-0.3.9.tar.gz
requires:
  - Python
  - pip
  - cons
  - multipledispatch
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