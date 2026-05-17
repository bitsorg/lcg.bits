package: m4
description: GNU M4 macro processor
version: "1.4.21"
tag: "1.4.21"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/m4-1.4.21.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
