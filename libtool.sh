package: libtool
description: GNU Libtool shared library support script
version: "2.4.6"
tag: "2.4.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libtool-2.4.6.tar.gz
build_requires:
  - bits-recipe-tools
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
