package: NsightSystems
description: NVIDIA Nsight Systems system-wide performance analysis tool
version: "unknown"
tag: "unknown"
requires:
  - cuda
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-NVIDIA-Nsight
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS}
  $SOURCEDIR/NsightSystems-linux-public-<NsightSystems_unknown_full>.run --quiet --noprogress -- -targetpath=$INSTALLROOT  : Specify install path -noprompt
}
