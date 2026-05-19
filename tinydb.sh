package: tinydb
description: TinyDB lightweight document-oriented database for Python
version: "4.8.2"
tag: "4.8.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tinydb-4.8.2.tar.gz
requires:
  - Python
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