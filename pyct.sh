package: pyct
description: pyct Python package
version: "0.5.0"
tag: "0.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyct-0.5.0.tar.gz
requires:
  - Python
  - setuptools
  - param
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - pyct-0.5.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################