package: pycairo
description: Pycairo Python bindings for the Cairo library
version: "1.29.0"
tag: "1.29.0"
#sources:
#  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - cairo
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only OR MPL-1.1
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function Prepare() {
  # pycairo uses meson as its build backend; meson calls pkg-config to find
  # cairo.  Expose CAIRO_ROOT's pkg-config, headers and libs so pip's isolated
  # build environment can locate them.
  export PKG_CONFIG_PATH="\
${CAIRO_ROOT:+${CAIRO_ROOT}/lib/pkgconfig}\
${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}:/usr/share/pkgconfig"
  export C_INCLUDE_PATH="${CAIRO_ROOT:+${CAIRO_ROOT}/include}${C_INCLUDE_PATH:+:${C_INCLUDE_PATH}}"
  export LIBRARY_PATH="${CAIRO_ROOT:+${CAIRO_ROOT}/lib}${LIBRARY_PATH:+:${LIBRARY_PATH}}"
  [ "$(uname -s)" = "Darwin" ] && export CPPFLAGS="-I/opt/X11/include ${CPPFLAGS:-}" || true
}
