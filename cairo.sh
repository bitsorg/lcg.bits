package: cairo
description: Cairo 2D vector graphics library with multiple backends
version: "1.18.4"
tag: "1.18.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - pixman
  - pkg_config
  - freetype
  - fontconfig
  - meson
  - ninja
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
prepend_path:
  PKG_CONFIG_PATH: "$CAIRO_ROOT/lib/pkgconfig"
---
#!/bin/bash -e
##############################
. $(bits-include MesonRecipe)
##############################
MODULE_OPTIONS="--lib --pkgconfig --cmake"
##############################
