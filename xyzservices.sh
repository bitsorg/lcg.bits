package: xyzservices
description: xyzservices Python package
version: "2023.5.0"
tag: "2023.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xyzservices-2023.5.0.tar.gz
requires:
  - Python
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