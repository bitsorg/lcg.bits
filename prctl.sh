package: prctl
description: prctl Python package
version: "1.8.1"
tag: "1.8.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/python-prctl-1.8.1.tar.gz
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