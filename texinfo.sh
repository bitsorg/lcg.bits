package: texinfo
description: texinfo library/tool (from LCG software stack)
version: "7.2"
tag: "7.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/texinfo-7.2.tar.gz
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
