package: hijing
description: HIJING Monte Carlo model for heavy-ion and pp collisions
version: "1.383bs.2"
tag: "1.383bs.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/hijing-1.383bs.2-src.tgz
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - hijing-1.383bs.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
