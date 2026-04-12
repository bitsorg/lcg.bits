package: dm_tree
description: dm_tree Python package
version: "0.1.9"
tag: "0.1.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dm_tree-0.1.9.tar.gz
requires:
  - Python
  - setuptools
  - six
  - pip
  - absl_py
  - attrs
  - numpy
  - wrapt
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