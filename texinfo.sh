package: texinfo
description: GNU Texinfo documentation system
version: "7.2"
tag: "7.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/texinfo-7.2.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
