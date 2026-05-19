package: py4j
description: Py4J enables Python programs to access Java objects
version: "0.10.9.9"
tag: "0.10.9.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/py4j-0.10.9.9.tar.gz
requires:
  - Python
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