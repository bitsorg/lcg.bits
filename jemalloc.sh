package: jemalloc
description: General-purpose scalable concurrent memory allocator
version: "5.3.0"
tag: "5.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jemalloc-5.3.0.tar.bz2
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
