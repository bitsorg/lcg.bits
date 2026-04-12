package: hbase
description: hbase library/tool (from LCG software stack)
version: "1.2.0"
tag: "1.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hbase-1.2.0-bin.tar.gz
requires:
  - java
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
