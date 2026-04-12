package: control
description: control Python package
version: "0.9.1"
tag: "0.9.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/control-0.9.1.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - scipy
  - matplotlib
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