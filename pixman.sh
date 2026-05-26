package: pixman
description: Pixman low-level pixel manipulation library
version: "0.46.0"
tag: "0.46.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - meson
  - ninja
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
prepend_path:
  PKG_CONFIG_PATH: "$PIXMAN_ROOT/lib/pkgconfig"
---
#!/bin/bash -e
##############################
. $(bits-include MesonRecipe)
##############################
MODULE_OPTIONS="--lib --pkgconfig"
