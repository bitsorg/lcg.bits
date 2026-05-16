package: hive
description: Apache Hive data warehouse for Hadoop
version: "1.1.1"
tag: "1.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/apache-hive-1.1.1-bin.tar.gz
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
