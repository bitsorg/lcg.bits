package: m4
description: GNU M4 general-purpose macro processor
version: "1.4.21"
tag: "1.4.21"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/m4-1.4.21.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
