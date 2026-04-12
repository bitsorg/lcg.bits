package: kiwisolver
description: kiwisolver Python package
version: "1.4.5"
tag: "1.4.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kiwisolver-1.4.5.tar.gz
requires:
  - Python
  - setuptools
  - cppy
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