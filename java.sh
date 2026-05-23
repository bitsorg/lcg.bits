package: java
description: OpenJDK Java Development Kit
version: "17.0.18p8"
tag: "17.0.18p8"
sources:
  - "(*x86-64*linux*)https://lcgpackages.web.cern.ch/tarFiles/sources/openjdk-%(version)s-linux-x64.tar.gz"
  - "(*aarch64*linux*)https://lcgpackages.web.cern.ch/tarFiles/sources/openjdk-%(version)s-linux-aarch64.tar.gz"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only WITH Classpath-exception-2.0
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
