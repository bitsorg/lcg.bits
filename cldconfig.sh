package: cldconfig
description: cldconfig Key4hep framework package
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cldconfig-HEAD.tar.gz
requires:
  - k4fwcore
  - delphes
  - pythia8
  - hepmc3
  - evtgen
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
