package: fribidi
description: GNU FriBidi Unicode bidirectional algorithm implementation
version: "1.0.13"
tag: "1.0.13"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.xz
requires:
  - CMake
  - meson
  - ninja
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
prepend_path:
  PKG_CONFIG_PATH: "$FRIBIDI_ROOT/lib/pkgconfig"
---
#!/bin/bash -e
##############################
. $(bits-include MesonRecipe)
##############################
MODULE_OPTIONS="--lib --pkgconfig"
MESON_WRAP_MODE="nofallback"
##############################
