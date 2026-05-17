package: gl2ps
description: GL2PS OpenGL to PostScript/SVG/PDF rendering library
version: "1.4.2"
tag: "1.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gl2ps-1.4.2.tgz
requires:
  - zlib
  - png
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GL2PS
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
