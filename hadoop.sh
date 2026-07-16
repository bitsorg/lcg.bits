package: hadoop
description: Apache Hadoop distributed storage and MapReduce framework
version: "3.3.6"
# git build disabled: needs submodule/monorepo (or non-git SCM) handling in the build body first.
# source: https://github.com/apache/hadoop
# tag: "rel/release-%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hadoop-3.3.6-src.tar.gz
requires:
  - CMake
  - maven
  - protobuf
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
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
function Configure() { :; }
function Make() {
  # HadoopJNI.cmake requires JAVA_HOME to locate jni.h; Maven itself works
  # without it (finds java via PATH) but the internal cmake call does not.
  [ -z "$JAVA_HOME" ] && \
    export JAVA_HOME="$(readlink -f /usr/bin/java | xargs dirname | xargs dirname)"
  mvn package -Pdist -DskipTests -Dmaven.javadoc.skip=true
  mvn -f hadoop-client-modules/hadoop-client/pom.xml install -Dgpg.skip=true dependency:copy-dependencies
  cmake -E copy_directory hadoop-dist/target/hadoop-3.3.6 $INSTALLROOT \
  && cmake -E copy_directory hadoop-client-modules/hadoop-client/target/hadoop-client-3.3.6 $INSTALLROOT \
  && chmod -R go+r $INSTALLROOT/share
}
function MakeInstall() { :; }
