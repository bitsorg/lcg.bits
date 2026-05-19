package: clikit
description: Clikit CLI framework toolkit for Python
version: "0.6.2"
tag: "0.6.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/clikit-0.6.2.tar.gz
requires:
  - Python
  - crashtest
  - pastel
  - pylev
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