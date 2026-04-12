package: scandir
description: scandir Python package
version: "1.10.0"
tag: "1.10.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/scandir-1.10.0.tar.gz
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