package: pyroscope
description: Pyroscope continuous profiling platform
version: "1.12.0"
tag: "1.12.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyroscope_1.12.0_linux_${pyroscope_ARCH}.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  cmake -E make_directory $INSTALLROOT/bin
  make ${JOBS:+-j $JOBS}
}
