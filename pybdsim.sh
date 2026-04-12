package: pybdsim
description: pybdsim Python package
version: "3.6.1"
tag: "3.6.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pybdsim-3.6.1).tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - scipy
  - Jinja2
  - pymadx
  - pytransport
  # optional:
  # - uproot
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