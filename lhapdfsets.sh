package: lhapdfsets
description: LHAPDF6 PDF data sets (parton distribution function grids)
version: "6.5.5"
tag: "6.5.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/lhapdf-6.5.5).tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS=""
##############################
