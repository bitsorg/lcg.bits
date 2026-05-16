package: fccsw
description: FCCSW Future Circular Collider Software framework
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fccsw-HEAD.tar.gz
requires:
  - DD4hep
  - k4geo
  - ROOT
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
