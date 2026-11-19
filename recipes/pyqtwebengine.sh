package: pyqtwebengine
description: PyQtWebEngine Python bindings for Qt WebEngine
version: "5.15.7"
tag: "5.15.7"
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
. $(bits-include PythonPipRecipe)
##############################
PYPI_NAME="PyQtWebEngine"
MODULE_OPTIONS="--bin --python"
##############################