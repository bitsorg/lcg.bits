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
---
#!/bin/bash -e
##############################
. $(bits-include MesonRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--lib --pkgconfig"
MESON_EXTRA_OPTIONS="-Dintrospection=disabled"
# macOS: pango can't resolve the bits harfbuzz via pkg-config, so meson builds the
# bundled harfbuzz subproject, whose gtk-doc step fails fetching DocBook XSL over
# the network. Disable doc generation for pango and the harfbuzz subproject.
bits_is_macos && MESON_EXTRA_OPTIONS="${MESON_EXTRA_OPTIONS} -Dgtk_doc=false -Dharfbuzz:docs=disabled"
##############################
