package: cfitsio
description: CFITSIO C library for reading and writing FITS files
version: "4.6.3"
source: https://github.com/HEASARC/cfitsio
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: CFITSIO
acknowledgment: "Includes CFITSIO software developed by NASA/HEASARC."
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
