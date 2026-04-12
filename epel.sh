package: epel
description: Extra Packages for Enterprise Linux (EPEL) repository setup
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/epel-unknown-${LCG_ARCH}-${LCG_OS}${LCG_OSVERS}.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
