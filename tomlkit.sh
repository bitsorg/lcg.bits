package: tomlkit
description: tomlkit Python package
version: "0.11.8"
tag: "0.11.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tomlkit-0.11.8.tar.gz
requires:
  - Python
  - setuptools
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