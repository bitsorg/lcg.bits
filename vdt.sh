package: vdt
description: vdt library/tool (from LCG software stack)
version: "0.4.4"
tag: "0.4.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/vdt-0.4.4.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - vdt-0.4.4.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
