package: glib
description: GLib core utility library for GNOME (strings, collections, mainloop)
version: "2.86.5"
source: https://gitlab.gnome.org/GNOME/glib
tag: "%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.xz
requires:
  - CMake
  - libffi
  - pkg_config
  - gettext
  - meson
  - pcre2
  - ninja
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include MesonRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
MESON_EXTRA_OPTIONS="-Dlibmount=disabled -Dtests=false"
##############################
function Configure() {
  _meson_fixenv
  CPPFLAGS="-I${GETTEXT_ROOT}/include" \
  LDFLAGS="-L${GETTEXT_ROOT}/lib" \
  meson setup "${MESON_BUILDDIR}" --prefix="${INSTALLROOT}" --libdir=lib ${MESON_EXTRA_OPTIONS}
}
