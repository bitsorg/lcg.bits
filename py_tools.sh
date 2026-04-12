package: py_tools
description: py_tools Python package
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pytools-unknown.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - appdirs
  - six
  - decorator
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