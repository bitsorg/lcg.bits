package: numba_stats
description: numba_stats Python package
version: "1.10.1"
tag: "1.10.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/numba-stats-1.10.1.tar.gz
requires:
  - Python
  - pip
  - numba
  - numpy
  - scipy
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