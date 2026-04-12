package: partd
description: partd Python package
version: "1.4.2"
tag: "1.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/partd-1.4.2.tar.gz
requires:
  - Python
  - setuptools
  - locket
  - toolz
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