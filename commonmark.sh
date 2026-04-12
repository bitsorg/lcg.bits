package: commonmark
description: commonmark Python package
version: "0.9.1"
tag: "0.9.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/commonmark-0.9.1.tar.gz
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