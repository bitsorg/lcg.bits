package: outcome
description: outcome Python package
version: "1.3.0"
tag: "1.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/outcome-1.3.0.tar.gz
requires:
  - Python
  - pip
  - attrs
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