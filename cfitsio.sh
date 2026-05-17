package: cfitsio
description: CFITSIO C library for reading and writing FITS files
version: "4.6.3"
tag: "4.6.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cfitsio-4.6.3.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-CFITSIO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
