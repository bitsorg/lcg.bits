package: pango
description: Pango library for text layout and rendering
version: "1.48.9"
source: https://gitlab.gnome.org/GNOME/pango
tag: "%(version)s"
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
# macOS: meson builds the bundled harfbuzz subproject whose gtk-doc step fails fetching DocBook XSL; disable doc gen
if bits_is_macos; then
  MESON_EXTRA_OPTIONS="${MESON_EXTRA_OPTIONS} -Dgtk_doc=false -Dharfbuzz:docs=disabled"
fi
##############################
