package: synr
description: synr Python package
version: "0.5.0"
tag: "0.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/synr-0.5.0.tar.gz
requires:
  - Python
  - setuptools
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