package: linkify_it_py
description: linkify-it-py links recognition library for Python
version: "2.0.2"
tag: "2.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/linkify-it-py-2.0.2.tar.gz
requires:
  - Python
  - uc_micro_py
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