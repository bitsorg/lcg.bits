package: glib
description: GLib core utility library for GNOME (strings, collections, mainloop)
version: "2.86.5"
tag: "2.86.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/glib-2.86.5.tar.xz
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
MODULE_OPTIONS="--bin --lib"
MESON_EXTRA_OPTIONS="-Dlibmount=disabled -Dtests=false"
##############################
function Configure() {
  CPPFLAGS="-I${gettext_ROOT}/include" \
  LDFLAGS="-L${gettext_ROOT}/lib" \
  meson setup ${MESON_BUILDDIR} --prefix=$INSTALLROOT ${MESON_EXTRA_OPTIONS}
}
