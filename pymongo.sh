package: pymongo
description: pymongo Python package
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pymongo-unknown.tar.gz
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