package: dcap
description: dCache access protocol (DCAP) client library
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dcap-unknown-${LCG_ARCH}-${LCG_OS}${LCG_OSVERS}.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
