package: backoff
description: backoff function decoration for exponential backoff retry
version: "2.2.1"
tag: "2.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/backoff-2.2.1.tar.gz
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