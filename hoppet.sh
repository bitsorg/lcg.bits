package: hoppet
description: HOPPET higher-order perturbative parton evolution toolkit
version: "1.2.0"
tag: "1.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/hoppet-1.2.0.tgz
build_requires:
  - bits-recipe-tools
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
