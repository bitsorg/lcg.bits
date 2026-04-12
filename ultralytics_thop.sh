package: ultralytics_thop
description: ultralytics_thop Python package
version: "2.0.14"
tag: "2.0.14"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ultralytics_thop-2.0.14.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - wheel
  - numpy
  - torch
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - ultralytics_thop-2.0.14.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################