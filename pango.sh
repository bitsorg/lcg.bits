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
# macOS: pango can't resolve the bits harfbuzz via pkg-config (transitive .pc
# resolution), so meson falls back to building the bundled harfbuzz subproject,
# whose `meson install` runs gtk-doc -> gtkdoc-mkhtml, which fails fetching the
# DocBook XSL over the network ("failed with status 5"). Disable doc generation
# for pango and the harfbuzz subproject. Darwin-only so the Linux build (which
# finds system harfbuzz and builds no subproject) is unchanged.
bits_is_macos && MESON_EXTRA_OPTIONS="${MESON_EXTRA_OPTIONS} -Dgtk_doc=false -Dharfbuzz:docs=disabled"
##############################
