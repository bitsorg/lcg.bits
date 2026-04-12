package: filelock
description: filelock Python package
version: "3.16.1"
tag: "3.16.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/filelock-3.16.1.tar.gz
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