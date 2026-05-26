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
  # Collect PKG_CONFIG_PATH and LD_LIBRARY_PATH from every *_ROOT so that
  # transitive deps (pixman, fontconfig, pcre2, …) are also reachable — both
  # for pkg-config .pc resolution and for the configure link-test binaries.
  for _hb_root_var in $(env | grep -E '^[A-Za-z][A-Za-z0-9_]*_ROOT=' | cut -d= -f1 | sort -u); do
    _hb_root="${!_hb_root_var}"
    [ -d "${_hb_root}/lib/pkgconfig" ] && \
      export PKG_CONFIG_PATH="${_hb_root}/lib/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"
    [ -d "${_hb_root}/lib" ] && \
      export LD_LIBRARY_PATH="${_hb_root}/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
  done
  export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+${PKG_CONFIG_PATH}:}/usr/share/pkgconfig"
  ./configure --prefix="${INSTALLROOT}" --with-cairo --with-freetype --with-glib
}
