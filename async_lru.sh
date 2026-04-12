package: async_lru
description: async_lru Python package
version: "2.0.4"
tag: "2.0.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/async-lru-2.0.4.tar.gz
requires:
  - Python
  - pip
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