package: pyqtwebengine
description: pyqtwebengine Python package
version: "5.12.1"
tag: "5.12.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/PyQtWebEngine_gpl-5.12.1.tar.gz
requires:
  - Python
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