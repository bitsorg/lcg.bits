package: pygraphviz
description: pygraphviz Python package
version: "1.11"
tag: "1.11"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pygraphviz-1.11.zip
requires:
  - Python
  - setuptools
  - graphviz
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