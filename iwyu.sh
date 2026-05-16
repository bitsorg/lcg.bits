package: iwyu
description: Include-What-You-Use C/C++ header analysis tool
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/include-what-you-use-unknown.src.tar.gz
build_requires:
  - bits-recipe-tools
license: LLVM-exception
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
