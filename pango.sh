package: pango
description: Pango library for text layout and rendering
version: "1.48.9"
tag: "1.48.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - cairo
  - harfbuzz
  - freetype
  - fontconfig
  - glib
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
prepend_path:
  PKG_CONFIG_PATH: "$PANGO_ROOT/lib/pkgconfig"
---
#!/bin/bash -e
##############################
. $(bits-include MesonRecipe)
##############################
MODULE_OPTIONS="--lib --pkgconfig"
MESON_WRAP_MODE="nofallback"
MESON_EXTRA_OPTIONS="-Dintrospection=disabled"
##############################
