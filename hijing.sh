package: hijing
description: HIJING heavy-ion jet interaction generator
version: "1.383bs.2"
tag: "1.383bs.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/hijing-1.383bs.2-src.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-HIJING
patches:
  - hijing-1.383bs.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
