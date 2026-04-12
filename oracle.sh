package: oracle
description: oracle library/tool (from LCG software stack)
version: "19.19.0.0.0"
tag: "19.19.0.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/oracle-19.19.0.0.0-${ora-arch}.tar.gz
requires:
  - libaio
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
