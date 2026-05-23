package: pyqt5_sip
description: PyQt5-sip SIP module for PyQt5
version: "12.15.0"
tag: "12.15.0"
requires:
  - Python
  - Qt5
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-only OR LGPL-3.0-only
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################