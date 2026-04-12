package: pytransport
description: pytransport Python package
version: "2.0.2"
tag: "2.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pytransport-2.0.2).tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - matplotlib
  - scipy
  - importlib_metadata
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