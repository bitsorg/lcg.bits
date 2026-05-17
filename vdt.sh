package: vdt
description: VDT vectorised math functions (CERN)
version: "0.4.4"
tag: "0.4.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/vdt-0.4.4.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
patches:
  - vdt-0.4.4.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
