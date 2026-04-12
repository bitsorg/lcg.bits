package: pyqt5_sip
description: pyqt5_sip Python package
version: "12.15.0"
tag: "12.15.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/PyQt5_sip-12.15.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - Qt5
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