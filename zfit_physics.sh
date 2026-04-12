package: zfit_physics
description: zfit_physics Python package
version: "0.9.0"
tag: "0.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/zfit_physics-0.9.0.tar.gz
requires:
  - Python
  - pip
  - zfit
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