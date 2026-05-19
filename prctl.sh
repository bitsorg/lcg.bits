package: prctl
description: prctl Linux process control utility
version: "1.8.1"
tag: "1.8.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/python-prctl-1.8.1.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################