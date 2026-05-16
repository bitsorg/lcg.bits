package: hadoop_xrootd
description: XRootD plugin for Hadoop distributed filesystem
version: "1.0.7"
tag: "1.0.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hadoop-xrootd-v1.0.7.tar.gz
requires:
  - java
  - maven
  - hadoop
  - xrootd
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
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  mvn clean package -DskipTests -Dxrootd.lib64.path=${xrootd_ROOT}/lib -Dxrootd.include.path=${xrootd_ROOT}/include/xrootd
  cmake -E make_directory $INSTALLROOT/lib
cmake
}