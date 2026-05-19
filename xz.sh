package: xz
description: XZ Utils lossless data compression (LZMA/XZ format)
version: "5.8.2"
tag: "5.8.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xz-5.8.2.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: 0BSD AND GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
