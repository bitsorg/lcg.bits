package: wcwidth
description: wcwidth Python package
version: "0.2.5"
tag: "0.2.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/wcwidth-0.2.5.tar.gz
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