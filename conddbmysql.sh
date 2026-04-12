package: conddbmysql
description: conddbmysql Key4hep framework package
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/conddbmysql-HEAD.tar.gz
requires:
  - mysql
  - ilcutil
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
