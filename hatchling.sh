package: hatchling
description: Hatchling extensible PEP 517 build backend
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
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################