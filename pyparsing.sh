package: pyparsing
description: pyparsing Python package
version: "3.2.5"
tag: "3.2.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyparsing-3.2.5.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - railroad_diagrams
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