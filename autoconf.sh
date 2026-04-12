package: autoconf
description: GNU Autoconf automatic configure script generator
version: "2.73"
tag: "2.73"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/autoconf-2.73.tar.gz
requires:
  - m4
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
