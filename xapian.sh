package: xapian
description: Xapian open-source probabilistic information retrieval library
version: "1.4.18"
tag: "1.4.18"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xapian-core-1.4.18.tar.gz
build_requires:
  - bits-recipe-tools
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
