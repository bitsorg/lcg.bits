package: PyJWT
description: PyJWT Python package
version: "2.0.1"
tag: "2.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/PyJWT-2.0.1.tar.gz
requires:
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