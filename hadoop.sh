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
  - java
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
  # Maven needs a real JDK and HadoopJNI.cmake needs JAVA_HOME to locate jni.h.
  # Use the bits java package (JAVA_ROOT): there is no system /usr/bin/java on
  # el9/el10, so the old derivation left JAVA_HOME=/usr (not a JDK) and Maven
  # aborted ("JAVA_HOME is not defined correctly").
  export JAVA_HOME="${JAVA_HOME:-${JAVA_ROOT}}"
  mvn package -Pdist -DskipTests -Dmaven.javadoc.skip=true
  mvn -f hadoop-client-modules/hadoop-client/pom.xml install -Dgpg.skip=true dependency:copy-dependencies
  cmake -E copy_directory hadoop-dist/target/hadoop-3.3.6 $INSTALLROOT \
  && cmake -E copy_directory hadoop-client-modules/hadoop-client/target/hadoop-client-3.3.6 $INSTALLROOT \
  && chmod -R go+r $INSTALLROOT/share
}
function MakeInstall() { :; }
