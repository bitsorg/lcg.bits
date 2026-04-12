package: pycryptodome
description: pycryptodome Python package
version: "3.21.0"
tag: "3.21.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pycryptodome-3.21.0.tar.gz
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