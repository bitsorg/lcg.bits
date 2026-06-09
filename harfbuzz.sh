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
  local _cairo="--with-cairo"
  if bits_is_macos; then
    # macOS: --with-cairo *requires* cairo, whose Homebrew .pc pulls in transitive
    # Requires (pixman-1, fontconfig, ...) not all on PKG_CONFIG_PATH. harfbuzz's
    # cairo integration is only used by the hb-view utility; the shaping library
    # that pango links needs only freetype/glib, so build without cairo.
    _cairo="--without-cairo"
    # brew freetype2.pc lists transitive Requires (zlib, bzip2, libpng, brotli)
    # whose .pc files are not on PKG_CONFIG_PATH (zlib has no .pc at all on macOS),
    # so `pkg-config --exists freetype2` fails ("Package 'zlib', required by
    # 'freetype2', not found"). Bypass the probe: autoconf's PKG_CHECK_MODULES
    # uses FREETYPE_CFLAGS/FREETYPE_LIBS verbatim when they are set, so point them
    # at the freetype dependency directly and skip pkg-config's transitive
    # resolution entirely. (brew freetype headers live under include/freetype2.)
    export FREETYPE_CFLAGS="-I${FREETYPE_ROOT}/include/freetype2 -I${FREETYPE_ROOT}/include"
    export FREETYPE_LIBS="-L${FREETYPE_ROOT}/lib -lfreetype"
    # hb-ft.cc casts void(*)(FT_Face) to FT_Generic_Finalizer (void(*)(void*)),
    # which newer clang flags under -Wcast-function-type-strict. harfbuzz's own
    # header hb.hh does `#pragma GCC diagnostic error "-Wcast-function-type"`, so
    # the cast is a hard error and neither a CXXFLAGS -Wno-... switch nor a
    # file-top pragma survives (hb.hh is included afterwards and re-enables it).
    # Insert the ignore pragmas immediately AFTER the `#include "hb.hh"` line, so
    # they take effect for the casts that follow. Darwin-only; the source is
    # rsynced into the build dir, so edit it in place (idempotent via the grep).
    if [ -f src/hb-ft.cc ] && ! grep -q 'cast-function-type-strict' src/hb-ft.cc; then
      perl -i -pe 's{^(\s*#include "hb\.hh".*)$}{$1\n#pragma clang diagnostic ignored "-Wcast-function-type"\n#pragma clang diagnostic ignored "-Wcast-function-type-strict"}' src/hb-ft.cc
    fi
  fi
  ./configure --prefix="${INSTALLROOT}" ${_cairo} --with-freetype --with-glib
}
