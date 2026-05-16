package: snowballstemmer
description: snowballstemmer snowball stemming algorithms for Python
version: "2.2.0"
tag: "2.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/snowballstemmer-2.2.0.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################