package: ant
description: Apache Ant Java build tool (pre-built binary distribution)
version: "1.10.7"
tag: "1.10.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/apache-ant-1.10.7-bin.tar.gz
requires:
  - java
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function MakeInstall() {
  cp -a bin lib etc "$INSTALLROOT/"
}
