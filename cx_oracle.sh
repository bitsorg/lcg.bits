package: cx_oracle
description: cx_Oracle Python interface to Oracle Database
version: "8.3.0"
tag: "8.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cx_Oracle-8.3.0.tar.gz
requires:
  - Python
  - setuptools
  - oracle
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
export ORACLE_HOME="${ORACLE_ROOT}"
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################