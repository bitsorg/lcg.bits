package: cairo
description: 2D vector graphics library with multiple output backends
version: "1.18.4"
tag: "1.18.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cairo-1.18.4.tar.gz
requires:
  - pixman
  - pkg_config
  - freetype
  - fontconfig
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
