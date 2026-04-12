package: rivet
description: Rivet Monte Carlo analysis toolkit
version: "3.1.5p1"
tag: "3.1.5p1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/Rivet-3.1.5p1.tar.bz2
build_requires:
  - bits-recipe-tools
license: GPL-3.0-only
patches:
  - rivet-3.1.5p1.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
