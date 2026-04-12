package: ppft
description: ppft Python package
version: "1.7.7"
tag: "1.7.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ppft-1.7.7.tar.gz
requires:
  - Python
  - setuptools
  - dill
  - six
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