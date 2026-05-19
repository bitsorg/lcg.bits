package: ant
description: Apache Ant Java build tool
version: "1.10.7"
tag: "1.10.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/apache-ant-1.10.7-bin.tar.gz
requires:
  - CMake
  - java
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Make() {
  make ${JOBS:+-j $JOBS}
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT/
}
