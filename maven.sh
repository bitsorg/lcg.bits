package: maven
description: Apache Maven project management and comprehension tool
version: "3.8.5"
tag: "3.8.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/apache-maven-3.8.5-bin.tar.gz
requires:
  - java
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - maven-3.8.5.patch
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
