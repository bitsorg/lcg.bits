package: julia
description: julia library/tool (from LCG software stack)
version: "1.11.6"
tag: "1.11.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/julia-1.11.6-mac64.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
