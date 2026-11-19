package: pyqt5
description: PyQt5 Python bindings for Qt5
version: "5.15.10"
tag: "5.15.10"
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
. $(bits-include PythonPipRecipe)
##############################
PYPI_NAME="PyQt5"
MODULE_OPTIONS="--bin --python"
##############################
