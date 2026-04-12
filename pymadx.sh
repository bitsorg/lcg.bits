package: pymadx
description: pymadx Python package
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pymadx-unknown.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - matplotlib
  - importlib_metadata
  - tabulate
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