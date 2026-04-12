package: identify
description: identify Python package
version: "2.5.24"
tag: "2.5.24"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/identify-2.5.24.tar.gz
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