package: clupatra
description: clupatra Key4hep framework package
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/clupatra-HEAD.tar.gz
requires:
  - ilcutil
  - marlin
  - marlinutil
  - GSL
  - DD4hep
  - ROOT
  - marlintrk
  - kaltest
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
