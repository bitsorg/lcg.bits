package: java
description: java library/tool (from LCG software stack)
version: "17.0.18p8"
tag: "17.0.18p8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openjdk-17.0.18p8-linux-${JAVA_ARCH}.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
