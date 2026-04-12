package: ninja
description: ninja library/tool (from LCG software stack)
version: "1.13.2"
tag: "1.13.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ninja-1.13.2.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################