package: MarkupSafe
description: MarkupSafe Python package
version: "2.1.5"
tag: "2.1.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MarkupSafe-2.1.5.tar.gz
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