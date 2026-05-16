package: graphviz_py
description: graphviz Python interface to Graphviz graph-drawing
version: "0.20.1"
tag: "0.20.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pygraphviz-0.20.1.zip
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################