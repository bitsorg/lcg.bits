package: attrs
description: attrs Python package
version: "25.1.0"
tag: "25.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/attrs-25.1.0.tar.gz
requires:
  - Python
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