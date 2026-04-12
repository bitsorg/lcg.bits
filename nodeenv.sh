package: nodeenv
description: nodeenv Python package
version: "1.9.1"
tag: "1.9.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/nodeenv-1.9.1.tar.gz
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