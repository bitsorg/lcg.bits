package: debugpy
description: debugpy Python package
version: "1.8.1"
tag: "1.8.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/debugpy-1.8.1.zip
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