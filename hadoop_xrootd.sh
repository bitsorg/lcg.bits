package: hadoop_xrootd
description: hadoop_xrootd library/tool (from LCG software stack)
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
  mvn clean package -DskipTests -Dxrootd.lib64.path=${xrootd_ROOT}/lib -Dxrootd.include.path=${xrootd_ROOT}/include/xrootd ELSE BUILD_COMMAND mvn clean package -DskipTests -Dxrootd.lib64.path=${xrootd_ROOT}/lib64 -Dxrootd.include.path=${xrootd_ROOT}/include/xrootd
  cmake -E make_directory $INSTALLROOT/lib COMMAND cmake
}