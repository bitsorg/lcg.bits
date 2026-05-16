package: jemalloc
description: jemalloc general-purpose scalable memory allocator
version: "5.3.0"
tag: "5.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jemalloc-5.3.0.tar.bz2
build_requires:
  - bits-recipe-tools
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
