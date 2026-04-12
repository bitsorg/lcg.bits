package: types_python_dateutil
description: types_python_dateutil Python package
version: "2.9.0.20241206"
tag: "2.9.0.20241206"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/types_python_dateutil-2.9.0.20241206.tar.gz
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