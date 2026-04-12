package: maven
description: maven library/tool (from LCG software stack)
version: "3.8.5"
tag: "3.8.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/apache-maven-3.8.5-bin.tar.gz
requires:
  - java
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - maven-3.8.5.patch
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
