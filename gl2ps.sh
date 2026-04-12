package: gl2ps
description: OpenGL to PostScript/PDF/SVG printing library
version: "1.4.2"
tag: "1.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gl2ps-1.4.2.tgz
requires:
  - zlib
  - png
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
