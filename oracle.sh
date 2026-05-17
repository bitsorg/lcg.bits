package: oracle
description: Oracle Database server
version: "19.19.0.0.0"
tag: "19.19.0.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/oracle-19.19.0.0.0-${ora-arch}.tar.gz
requires:
  - libaio
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-Oracle
---
#!/bin/bash -e
##############################
. $(bits-include BinaryRecipe)
##############################
