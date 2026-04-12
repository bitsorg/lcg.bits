package: pygraphics
description: pygraphics Python package
version: "2.0"
tag: "2.0"
requires:
  - pydot
  - sip
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