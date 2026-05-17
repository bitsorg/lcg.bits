package: pymysql
description: PyMySQL pure-Python MySQL client library
version: "1.1.2"
tag: "1.1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pymysql-1.1.2.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################