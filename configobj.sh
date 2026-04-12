package: configobj
description: configobj Python package
version: "5.0.9"
tag: "5.0.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/configobj-5.0.9.tar.gz
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