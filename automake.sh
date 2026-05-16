package: automake
description: GNU Automake Makefile generator
version: "1.18.1"
tag: "1.18.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/automake-1.18.1.tar.gz
requires:
  - autoconf
build_requires:
  - bits-recipe-tools
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
