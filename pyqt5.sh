package: pyqt5
description: pyqt5 Python package
version: "5.15.10"
tag: "5.15.10"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/PyQt5_gpl-5.15.10.tar.gz
requires:
  - Python
  - Qt5
  - sip
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