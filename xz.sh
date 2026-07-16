package: xz
description: XZ Utils lossless data compression (LZMA/XZ format)
version: "5.8.2"
source: https://github.com/tukaani-project/xz
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
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
