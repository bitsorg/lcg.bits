package: xz
description: xz library/tool (from LCG software stack)
version: "5.8.2"
tag: "5.8.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xz-5.8.2.tar.gz
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
