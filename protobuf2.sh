package: protobuf2
description: protobuf2 library/tool (from LCG software stack)
version: "2.5.0"
tag: "2.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/protobuf-2.5.0.tar.gz
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
