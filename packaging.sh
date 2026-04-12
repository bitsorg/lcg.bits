package: packaging
description: packaging Python package
version: "24.2"
tag: "24.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/packaging-24.2.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - pyparsing
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