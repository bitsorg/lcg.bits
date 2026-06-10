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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  # Collect PKG_CONFIG_PATH + LD_LIBRARY_PATH from every bits *_ROOT so transitive
  # deps (pixman, fontconfig) are reachable, not just direct ones. The lib/*/pkgconfig
  # glob covers old multiarch builds (lib/x86_64-linux-gnu) before --libdir=lib.
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
  local _cairo="--with-cairo"
  if bits_is_macos; then
    # macOS: cairo is only used by hb-view; the shaping lib pango links needs
    # only freetype/glib, so drop cairo and its transitive .pc requirements.
    _cairo="--without-cairo"
    # brew freetype2.pc Requires (zlib etc) aren't on PKG_CONFIG_PATH so the
    # pkg-config probe fails; set FREETYPE_CFLAGS/LIBS so PKG_CHECK_MODULES uses
    # them verbatim and skips resolution. (brew headers in include/freetype2.)
    export FREETYPE_CFLAGS="-I${FREETYPE_ROOT}/include/freetype2 -I${FREETYPE_ROOT}/include"
    export FREETYPE_LIBS="-L${FREETYPE_ROOT}/lib -lfreetype"
    # macOS: hb-ft.cc has a cast clang errors on via -Wcast-function-type-strict;
    # hb.hh promotes -Wcast-function-type to error after inclusion, so global pragmas
    # don't survive. Inject ignore pragmas after `#include "hb.hh"` (grep-idempotent).
    if [ -f src/hb-ft.cc ] && ! grep -q 'cast-function-type-strict' src/hb-ft.cc; then
      perl -i -pe 's{^(\s*#include "hb\.hh".*)$}{$1\n#pragma clang diagnostic ignored "-Wcast-function-type"\n#pragma clang diagnostic ignored "-Wcast-function-type-strict"}' src/hb-ft.cc
    fi
  fi
  ./configure --prefix="${INSTALLROOT}" ${_cairo} --with-freetype --with-glib
}
