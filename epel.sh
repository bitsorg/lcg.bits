package: epel
description: EPEL (Extra Packages for Enterprise Linux) package set
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/epel-unknown-${LCG_ARCH}-${LCG_OS}${LCG_OSVERS}.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS=""
##############################
