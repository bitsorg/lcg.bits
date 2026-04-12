package: wrapt
description: wrapt Python package
version: "1.16.0"
tag: "1.16.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/wrapt-1.16.0.tar.gz
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