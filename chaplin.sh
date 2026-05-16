package: chaplin
description: CHAPLIN complex harmonic polylogarithm library
version: "1.2"
tag: "1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/chaplin-1.2.tar.gz
build_requires:
  - bits-recipe-tools
license: MIT
patches:
  - chaplin-1.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
