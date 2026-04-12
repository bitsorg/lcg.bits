package: dill
description: dill Python package
version: "0.4.0"
tag: "0.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dill-0.4.0.tar.gz
requires:
  - Python
  - setuptools
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