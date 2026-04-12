package: plotext
description: plotext Python package
version: "5.2.7"
tag: "5.2.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/plotext-5.2.7.tar.gz
requires:
  - Python
  - setuptools
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