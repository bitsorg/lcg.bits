package: chardet
description: chardet Python package
version: "5.2.0"
tag: "5.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/chardet-5.2.0.tar.gz
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