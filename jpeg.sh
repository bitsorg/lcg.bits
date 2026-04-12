package: jpeg
description: jpeg library/tool (from LCG software stack)
version: "3.1.3"
tag: "3.1.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libjpeg-turbo-3.1.3.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -D \
    -D \
    -D
}
