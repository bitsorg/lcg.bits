package: libgit2
description: libgit2 portable C implementation of Git core
version: "1.1.1"
tag: "1.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libgit2-1.1.1.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
license: GPL-2.0-only WITH GCC-exception-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
