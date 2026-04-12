package: mimalloc
description: mimalloc library/tool (from LCG software stack)
version: "3.2.6"
tag: "3.2.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mimalloc-3.2.6).tar.gz
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
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=${ENABLE_IPO}
}
