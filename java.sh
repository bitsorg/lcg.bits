package: java
description: OpenJDK Java Development Kit
version: "17.0.18p8"
tag: "17.0.18p8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openjdk-17.0.18p8-linux-${JAVA_ARCH}.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only WITH Classpath-exception-2.0
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
