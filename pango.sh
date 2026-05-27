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
MESON_EXTRA_OPTIONS="-Dintrospection=disabled"
##############################
function Configure() {
  _meson_fixenv
  # freetype has prefer_system so its .pc lives at a system multiarch path
  # outside bits' managed PKG_CONFIG_PATH.  Pass system pkg-config dirs to
  # meson via --pkg-config-path (meson appends these when calling pkg-config
  # subprocesses) so that fontconfig's transitive "Requires: freetype2"
  # resolves.  Do NOT touch PKG_CONFIG_PATH itself — bits uses it for
  # bits-built packages (glib, harfbuzz, etc.) and modifying it breaks them.
  local _triple
  _triple=$(gcc -dumpmachine 2>/dev/null || echo "x86_64-linux-gnu")
  meson setup "${MESON_BUILDDIR}" \
    --prefix="${INSTALLROOT}" \
    --libdir=lib \
    --wrap-mode=nofallback \
    --pkg-config-path="/usr/lib/${_triple}/pkgconfig" \
    --pkg-config-path="/usr/lib/pkgconfig" \
    --pkg-config-path="/usr/share/pkgconfig" \
    ${MESON_EXTRA_OPTIONS}
}
##############################
