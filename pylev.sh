package: pylev
description: pylev Python Levenshtein distance library
version: "1.4.0"
tag: "1.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pylev-1.4.0.tar.gz
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