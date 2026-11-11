package: glib
description: GLib core utility library for GNOME (strings, collections, mainloop)
version: "2.88.1"
source: https://gitlab.gnome.org/GNOME/glib
tag: "%(version)s"
# bits upgrade: no tarball of 2.88.1 in the usual place, upstream's instead
sources:
  - https://download.gnome.org/sources/glib/2.88/glib-%(version)s.tar.xz
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
references:
  - cpe:2.3:a:gnome:glib:%(version)s
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
