package: appdirs
description: appdirs Python package
version: "1.4.4"
tag: "1.4.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/appdirs-1.4.4.tar.gz
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