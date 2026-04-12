package: pydot_ng
description: pydot_ng Python package
version: "2.0.0"
tag: "2.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pydot_ng-2.0.0.tar.gz
requires:
  - Python
  - pyparsing
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