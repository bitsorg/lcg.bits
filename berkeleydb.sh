package: berkeleydb
description: berkeleydb Python bindings for Oracle Berkeley DB
version: "18.1.15"
tag: "18.1.15"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/berkeleydb-18.1.15.tar.gz
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