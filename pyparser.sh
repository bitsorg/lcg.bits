package: pyparser
description: pyparser Pyparsing-based parser utilities
version: "1.0"
tag: "1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyparser-1.0.tar.gz
requires:
  - Python
  - setuptools
  - parse
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