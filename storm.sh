package: storm
description: Apache Storm distributed real-time computation system
version: "0.23"
tag: "0.23"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/storm-0.23.tar.bz2
requires:
  - Python
  - six
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################