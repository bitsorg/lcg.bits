package: dcap
description: dCache client access protocol (dCap) library
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dcap-unknown-${LCG_ARCH}-${LCG_OS}${LCG_OSVERS}.tar.gz
build_requires:
  - bits-recipe-tools
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
