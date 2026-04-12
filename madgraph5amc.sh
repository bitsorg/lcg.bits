package: madgraph5amc
description: madgraph5amc Monte Carlo event generator
version: "3.3.1.atlas1"
tag: "3.3.1.atlas1"
sources:
  - https://launchpad.net/mg5amcnlo/2.0/2.1.0/+download/MG5_aMC_v3.3.1.atlas1.tar.gz
requires:
  - Python
  - syscalc
  - six
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - madgraph5amc-3.3.1.atlas1.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  <VOID> #
  make ${JOBS:+-j $JOBS} -j1 -C vendor/CutTools #        COMMAND make ${JOBS:+-j $JOBS} -j1 -C vendor/StdHEP #
  $SHELL -c "echo Installing madgraph 3.3.1.atlas1" COMMAND cmake -DSRC=$SOURCEDIR -DDST=$INSTALLROOT -P # (lcgcmake-internal script removed)
}