package: qtpy
description: QtPy thin abstraction layer over PyQt5/PySide2
version: "2.4.2"
tag: "2.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/QtPy-2.4.2.tar.gz
requires:
  - Python
  - pyqt5
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################