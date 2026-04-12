package: xapian
description: xapian library/tool (from LCG software stack)
version: "1.4.18"
tag: "1.4.18"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xapian-core-1.4.18.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
