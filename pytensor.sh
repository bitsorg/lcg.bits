package: pytensor
description: pytensor Python package
version: "2.35.1"
tag: "2.35.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pytensor-2.35.1.tar.gz
requires:
  - Python
  - pip
  - cons
  - etuples
  - filelock
  - logical_unification
  - minikanren
  - numpy
  - scipy
  - typing_extensions
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - pytensor-2.35.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################