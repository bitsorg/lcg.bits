package: pyqt5
description: PyQt5 Python bindings for Qt5
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
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-only OR LGPL-3.0-only
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################