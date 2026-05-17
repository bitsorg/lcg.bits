package: png
description: libpng official PNG reference library
version: "1.6.55"
tag: "1.6.55"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libpng-1.6.55.tar.gz
requires:
  - zlib
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Libpng
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
