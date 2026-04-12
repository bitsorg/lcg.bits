package: Authlib
description: Authlib Python package
version: "0.15.5"
tag: "0.15.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Authlib-0.15.5.tar.gz
requires:
  - Python
  - setuptools
  - cryptography
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