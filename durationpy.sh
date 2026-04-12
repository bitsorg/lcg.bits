package: durationpy
description: durationpy Python package
version: "0.10"
tag: "0.10"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/durationpy-0.10.tar.gz
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