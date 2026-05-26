package: pycairo
description: Pycairo Python bindings for the Cairo library
version: "1.28.0"
tag: "1.28.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - cairo
build_requires:
  - meson_python
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only OR MPL-1.1
---
#!/bin/bash -e
export PKG_CONFIG_PATH="\
${CAIRO_ROOT:+${CAIRO_ROOT}/lib/pkgconfig}\
${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}:/usr/share/pkgconfig"
export C_INCLUDE_PATH="${CAIRO_ROOT:+${CAIRO_ROOT}/include}${C_INCLUDE_PATH:+:${C_INCLUDE_PATH}}"
export LIBRARY_PATH="${CAIRO_ROOT:+${CAIRO_ROOT}/lib}${LIBRARY_PATH:+:${LIBRARY_PATH}}"
[ "$(uname -s)" = "Darwin" ] && export CPPFLAGS="-I/opt/X11/include ${CPPFLAGS:-}" || true
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################

