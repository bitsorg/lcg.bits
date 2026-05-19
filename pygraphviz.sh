package: pygraphviz
description: PyGraphviz Python interface to Graphviz graph library
version: "1.11"
tag: "1.11"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pygraphviz-1.11.zip
requires:
  - Python
  - graphviz
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