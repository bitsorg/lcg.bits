package: geos
description: GEOS geometry engine for GIS and computational geometry
version: "3.7.2"
tag: "3.7.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/geos-3.7.2.tar.bz2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
