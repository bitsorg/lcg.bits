package: clhep
description: Class Library for High Energy Physics
version: "2.4.7.2"
tag: "2.4.7.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/clhep-2.4.7.2.tgz
build_requires:
  - bits-recipe-tools
license: LGPL-3.0-only
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
