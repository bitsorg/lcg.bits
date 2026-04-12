package: execnet
description: execnet Python package
version: "2.1.1"
tag: "2.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/execnet-2.1.1.tar.gz
requires:
  - Python
  - setuptools
  - pip
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