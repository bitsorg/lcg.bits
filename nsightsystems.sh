package: NsightSystems
description: NsightSystems library/tool (from LCG software stack)
version: "unknown"
tag: "unknown"
requires:
  - cuda
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
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS}
  $SOURCEDIR/NsightSystems-linux-public-<NsightSystems_unknown_full>.run --quiet --noprogress -- -targetpath=$INSTALLROOT  : Specify install path -noprompt
}
