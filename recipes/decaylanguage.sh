package: DecayLanguage
description: DecayLanguage toolkit for decay descriptor parsing (HEP)
version: "0.20.0"
tag: "0.20.0"
requires:
  - Python
  - attrs
  - deprecated
  - graphviz_py
  - lark
  - numpy
  - pandas
  - particle
  - plumbum
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