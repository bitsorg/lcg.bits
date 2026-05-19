package: asyncache
description: asyncache cache helper for async functions
version: "0.3.1"
tag: "0.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/asyncache-0.3.1.tar.gz
requires:
  - Python
  - cachetools
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