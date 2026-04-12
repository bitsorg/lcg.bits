package: pyserial
description: pyserial Python package
version: "3.4"
tag: "3.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyserial-3.4.tar.gz
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