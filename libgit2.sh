package: libgit2
description: libgit2 library/tool (from LCG software stack)
version: "1.1.1"
tag: "1.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libgit2-1.1.1.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
