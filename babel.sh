package: babel
description: babel Python package
version: "2.17.0"
tag: "2.17.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Babel-2.17.0.tar.gz
requires:
  - Python
  - setuptools
  - pytz
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