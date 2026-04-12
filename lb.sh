package: lb
description: LHCb build tool binary package
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lb-unknown-${LCG_ARCH}-${LCG_OS}${LCG_OSVERS}.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
