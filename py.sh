package: py
description: py library with cross-python path and file utilities
version: "1.11.0"
tag: "1.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/py-1.11.0.tar.gz
requires:
  - Python
  - setuptools
  - setuptools_scm
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################