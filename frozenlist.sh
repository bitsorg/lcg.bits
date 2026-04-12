package: frozenlist
description: frozenlist Python package
version: "1.4.1"
tag: "1.4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/frozenlist-1.4.1.tar.gz
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