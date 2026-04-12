package: pixman
description: Pixel manipulation library for X and Cairo
version: "0.46.0"
tag: "0.46.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pixman-0.46.0.tar.gz
requires:
  - meson
  - ninja
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include MesonRecipe)
##############################
