package: pango
description: Pango library for text layout and rendering
version: "1.48.9"
tag: "1.48.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pango-1.48.9.tar.gz
requires:
  - cairo
  - harfbuzz
  - freetype
  - fontconfig
  - glib
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include MesonRecipe)
##############################
MESON_WRAP_MODE="nofallback"
MESON_EXTRA_OPTIONS="-Dintrospection=disabled"
##############################
