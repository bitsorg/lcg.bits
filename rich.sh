package: rich
description: Rich Python library for rich text and beautiful formatting
version: "13.9.4"
tag: "13.9.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rich-13.9.4.tar.gz
requires:
  - Python
  - commonmark
  - pygments
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################