package: uhi
description: uhi Python package
version: "0.3.0"
tag: "0.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/uhi-0.3.0.tar.gz
requires:
  - Python
  - setuptools
  - numpy
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