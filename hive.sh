package: hive
description: Apache Hive data warehouse for Hadoop
version: "1.1.1"
# git build disabled: needs submodule/monorepo (or non-git SCM) handling in the build body first.
# source: https://github.com/apache/hive
# tag: "rel/release-%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/apache-hive-1.1.1-bin.tar.gz
requires:
  - java
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
