package: qtpy
description: qtpy Python package
version: "2.4.2"
tag: "2.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/QtPy-2.4.2.tar.gz
requires:
  - Python
  - setuptools
  - pyqt5
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