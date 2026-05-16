package: protobuf2
description: Google Protocol Buffers v2 serialization library (legacy)
version: "2.5.0"
tag: "2.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/protobuf-2.5.0.tar.gz
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
