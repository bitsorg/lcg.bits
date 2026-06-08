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
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  # configure uses pkg-config to locate glib-2.0, freetype2, cairo, etc.
  # Collect PKG_CONFIG_PATH and LD_LIBRARY_PATH from every bits-managed *_ROOT
  # so that transitive deps (pixman, fontconfig, …) are also reachable.
  # Module prepend_path only adds direct deps; indirect ones can be missing.
  # The multiarch glob (lib/*/pkgconfig) covers old builds that landed at
  # lib/x86_64-linux-gnu/pkgconfig before --libdir=lib was enforced.
  for _hb_root_var in $(env | grep -E '^[A-Za-z][A-Za-z0-9_]*_ROOT=' | cut -d= -f1 | sort -u); do
    _hb_root="${!_hb_root_var}"
    for _hb_pc_dir in "${_hb_root}/lib/pkgconfig" "${_hb_root}/share/pkgconfig" \
                      "${_hb_root}"/lib/*/pkgconfig; do
      [ -d "${_hb_pc_dir}" ] && \
        export PKG_CONFIG_PATH="${_hb_pc_dir}${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"
    done
    [ -d "${_hb_root}/lib" ] && \
      export LD_LIBRARY_PATH="${_hb_root}/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
  done
  # macOS: --with-cairo *requires* cairo, whose Homebrew .pc pulls in transitive
  # Requires (pixman-1, fontconfig, ...) not all on PKG_CONFIG_PATH, so configure
  # aborts "cairo support requested but not found". harfbuzz's cairo integration
  # is only used by the hb-view utility; the shaping library that pango links
  # does not need it, so build without cairo on macOS. Linux keeps --with-cairo.
  local _cairo="--with-cairo"
  [ "$(uname)" = Darwin ] && _cairo="--without-cairo"
  ./configure --prefix="${INSTALLROOT}" ${_cairo} --with-freetype --with-glib
}
