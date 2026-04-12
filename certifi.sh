package: certifi
description: certifi Python package
version: "2024.8.30"
tag: "2024.8.30"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/certifi-2024.8.30.tar.gz
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