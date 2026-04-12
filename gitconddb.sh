package: GitCondDB
description: GitCondDB library/tool (from LCG software stack)
version: "0.2.2"
tag: "0.2.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/GitCondDB-0.2.2.tar.gz
requires:
  - libgit2
  - fmt
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
