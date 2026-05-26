package: harfbuzz
description: HarfBuzz OpenType text shaping engine
version: "2.7.4"
tag: "2.7.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - freetype
  - glib
  - cairo
  - libffi
  - pkg_config
  - gettext
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
prepend_path:
  PKG_CONFIG_PATH: "$HARFBUZZ_ROOT/lib/pkgconfig"
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  # configure uses pkg-config to locate glib-2.0, freetype2, cairo, etc.
  # All non-system dep lib dirs must be in PKG_CONFIG_PATH (so pkg-config
  # finds them) and LD_LIBRARY_PATH (so the configure compile-and-link tests
  # can actually run the produced binaries against the shared libs).
  export PKG_CONFIG_PATH="\
${GLIB_ROOT:+${GLIB_ROOT}/lib/pkgconfig}\
${FREETYPE_ROOT:+:${FREETYPE_ROOT}/lib/pkgconfig}\
${CAIRO_ROOT:+:${CAIRO_ROOT}/lib/pkgconfig}\
${LIBFFI_ROOT:+:${LIBFFI_ROOT}/lib/pkgconfig}\
${GETTEXT_ROOT:+:${GETTEXT_ROOT}/lib/pkgconfig}\
${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"
  export LD_LIBRARY_PATH="\
${GLIB_ROOT:+${GLIB_ROOT}/lib}\
${FREETYPE_ROOT:+:${FREETYPE_ROOT}/lib}\
${CAIRO_ROOT:+:${CAIRO_ROOT}/lib}\
${LIBFFI_ROOT:+:${LIBFFI_ROOT}/lib}\
${GETTEXT_ROOT:+:${GETTEXT_ROOT}/lib}\
${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
  ./configure --prefix="${INSTALLROOT}" --with-cairo --with-freetype --with-glib
}
