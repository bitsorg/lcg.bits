package: minikanren
description: miniKanren logic programming micro-framework for Python
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
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################