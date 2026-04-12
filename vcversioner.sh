package: vcversioner
description: vcversioner Python package
version: "2.16.0.0"
tag: "2.16.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/vcversioner-2.16.0.0.tar.gz
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