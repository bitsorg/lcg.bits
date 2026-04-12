package: graphviz_py
description: graphviz_py Python package
version: "0.20.1"
tag: "0.20.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pygraphviz-0.20.1.zip
requires:
  - Python
  - setuptools
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