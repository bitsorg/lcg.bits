package: snowballstemmer
description: snowballstemmer Python package
version: "2.2.0"
tag: "2.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/snowballstemmer-2.2.0.tar.gz
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