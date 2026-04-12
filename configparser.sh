package: configparser
description: configparser Python package
version: "5.3.0"
tag: "5.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/configparser-5.3.0.tar.gz
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