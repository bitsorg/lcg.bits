package: nanomsg
description: nanomsg library/tool (from LCG software stack)
version: "1.1.5"
tag: "1.1.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/nanomsg-1.1.5.tar.gz
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
