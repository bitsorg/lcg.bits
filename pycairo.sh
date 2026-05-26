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
# Collect PKG_CONFIG_PATH from every available *_ROOT variable so that
# cairo.pc's transitive Requires (pixman-1, freetype2, fontconfig, …) can
# be resolved by pkg-config even before those deps have been rebuilt with
# an updated init.sh.  The same pattern is used by PythonRecipe for PYTHONPATH.
for _pc_root_var in $(env | grep -E '^[A-Za-z][A-Za-z0-9_]*_ROOT=' | cut -d= -f1 | sort -u); do
  _pc_dir="${!_pc_root_var}/lib/pkgconfig"
  [ -d "${_pc_dir}" ] || continue
  export PKG_CONFIG_PATH="${_pc_dir}${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"
done
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+${PKG_CONFIG_PATH}:}/usr/share/pkgconfig"
export C_INCLUDE_PATH="${CAIRO_ROOT:+${CAIRO_ROOT}/include}${C_INCLUDE_PATH:+:${C_INCLUDE_PATH}}"
export LIBRARY_PATH="${CAIRO_ROOT:+${CAIRO_ROOT}/lib}${LIBRARY_PATH:+:${LIBRARY_PATH}}"
[ "$(uname -s)" = "Darwin" ] && export CPPFLAGS="-I/opt/X11/include ${CPPFLAGS:-}" || true
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################

