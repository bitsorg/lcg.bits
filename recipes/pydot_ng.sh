package: pydot_ng
description: pydot-ng improved Python interface to Graphviz
version: "2.0.0"
tag: "2.0.0"
requires:
  - Python
  - pyparsing
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################