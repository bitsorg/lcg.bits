package: pygraphics
description: pygraphics Python turtle graphics and image library
version: "2.0"
tag: "2.0"
requires:
  - pydot
  - sip
  - pyqt5
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################