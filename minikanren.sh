package: minikanren
description: minikanren Python package
version: "1.0.3"
tag: "1.0.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/miniKanren-1.0.3.tar.gz
requires:
  - Python
  - pip
  - cons
  - etuples
  - logical_unification
  - multipledispatch
  - toolz
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