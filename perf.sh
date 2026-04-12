package: perf
description: perf library/tool (from LCG software stack)
version: "20250408"
tag: "20250408"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/linux-dev-20250408.tar.gz
requires:
  - libtraceevent
  - libbpf
  - flex
  - Python
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - perf-20250408.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ""/compile_perf.sh $INSTALLROOT COMPILE
  ""/compile_perf.sh $INSTALLROOT INSTALL
}
