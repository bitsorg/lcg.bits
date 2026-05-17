package: pixman
description: Pixman low-level pixel manipulation library
version: "0.46.0"
tag: "0.46.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pixman-0.46.0.tar.gz
requires:
  - meson
  - ninja
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include MesonRecipe)
##############################
