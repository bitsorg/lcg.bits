package: async_lru
description: async_lru LRU cache decorator for async functions
version: "2.0.4"
tag: "2.0.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/async-lru-2.0.4.tar.gz
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