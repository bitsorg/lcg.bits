package: readline
description: GNU Readline command-line editing and history library
version: "8.0"
tag: "8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/readline-8.0.tar.gz
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
