package: fribidi
description: fribidi library/tool (from LCG software stack)
version: "1.0.13"
tag: "1.0.13"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fribidi-1.0.13.tar.xz
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
MESON_WRAP_MODE="nofallback"
##############################
