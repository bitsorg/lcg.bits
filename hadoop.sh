package: hadoop
description: hadoop library/tool (from LCG software stack)
version: "3.3.6"
tag: "3.3.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hadoop-3.3.6-src.tar.gz
requires:
  - maven
  - protobuf
build_requires:
  - bits-recipe-tools
license: TODO
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
  mvn package -Pdist,native -DskipTests -Dmaven.javadoc.skip=true COMMAND mvn -f hadoop-client-modules/hadoop-client/pom.xml install -Dgpg.skip=true dependency:copy-dependencies
  cmake -E copy_directory hadoop-dist/target/hadoop-3.3.6 $INSTALLROOT COMMAND cmake -E copy_directory hadoop-client-modules/hadoop-client/target/hadoop-client-3.3.6 $INSTALLROOT COMMAND chmod -R go+r $INSTALLROOT/share ELSE
}
