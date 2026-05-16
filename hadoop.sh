package: hadoop
description: Apache Hadoop distributed storage and MapReduce framework
version: "3.3.6"
tag: "3.3.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hadoop-3.3.6-src.tar.gz
requires:
  - maven
  - protobuf
build_requires:
  - bits-recipe-tools
license: Apache-2.0
patches:
  - hadoop-3.3.6.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  mvn package -Pdist,native -DskipTests -Dmaven.javadoc.skip=true
  mvn -f hadoop-client-modules/hadoop-client/pom.xml install -Dgpg.skip=true dependency:copy-dependencies
  cmake -E copy_directory hadoop-dist/target/hadoop-3.3.6 $INSTALLROOT \
  && cmake -E copy_directory hadoop-client-modules/hadoop-client/target/hadoop-client-3.3.6 $INSTALLROOT \
  && chmod -R go+r $INSTALLROOT/share
}
