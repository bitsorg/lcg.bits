package: configparser
description: configparser backport of Python 3 configparser module
version: "5.3.0"
tag: "5.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/configparser-5.3.0.tar.gz
requires:
  - Python
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