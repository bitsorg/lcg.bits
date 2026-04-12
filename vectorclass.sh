package: vectorclass
description: vectorclass library/tool (from LCG software stack)
version: "2.01.02"
tag: "2.01.02"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/vectorclass-2.01.02.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--include"
##############################
