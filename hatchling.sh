package: hatchling
description: hatchling Python package
version: "1.28.0"
tag: "1.28.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hatchling-1.28.0).tar.gz
requires:
  - Python
  - pip
  - setuptools
  - pluggy
  - tomli
  - pathspec
  - trove_classifiers
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