package: cfgv
description: cfgv validate and apply defaults to configuration files
version: "3.3.1"
tag: "3.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cfgv-3.3.1.tar.gz
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