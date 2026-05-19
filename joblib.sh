package: joblib
description: joblib tools for pipelining in Python (caching, parallelism)
version: "1.5.3"
tag: "1.5.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/joblib-1.5.3.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################