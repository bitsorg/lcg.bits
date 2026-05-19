package: pyqtwebengine
description: PyQtWebEngine Python bindings for Qt WebEngine
version: "5.12.1"
tag: "5.12.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/PyQtWebEngine_gpl-5.12.1.tar.gz
requires:
  - Python
  - pyqt5
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-only
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################