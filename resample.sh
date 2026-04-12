package: resample
description: resample Python package
version: "1.10.1"
tag: "1.10.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/resample-1.10.1.tar.gz
requires:
  - Python
  - pip
  - numpy
  - scipy
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