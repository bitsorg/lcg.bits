package: GraalVM
description: GraalVM polyglot runtime (JVM + native image)
version: "22.0.0.2"
tag: "22.0.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/graalvm-ce-java11-linux-amd64-22.0.0.2.tar.gz
requires:
  - java
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only WITH Classpath-exception-2.0
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Make() {
  make ${JOBS:+-j $JOBS}
  $SHELL -c "cp -r $SOURCEDIR $INSTALLROOT" # symlinks need to be preserved for graalHome to be found
}