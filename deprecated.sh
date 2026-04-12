package: deprecated
description: deprecated Python package
version: "1.2.13"
tag: "1.2.13"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Deprecated-1.2.13.tar.gz
requires:
  - Python
  - setuptools
  - wrapt
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