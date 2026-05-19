package: flexcache
description: FlexCache flexible memoization with cache invalidation
version: "0.3"
tag: "0.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/flexcache-0.3.tar.gz
requires:
  - Python
  - typing_extensions
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