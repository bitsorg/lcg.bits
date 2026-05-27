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
# Collect PKG_CONFIG_PATH from every bits-managed *_ROOT so that cairo.pc's
# transitive Requires: (pixman-1, fontconfig, …) can be resolved.  Module
# prepend_path only adds directly required packages; indirect deps may be
# missing.  The multiarch glob (lib/*/pkgconfig) also covers old builds that
# landed at lib/x86_64-linux-gnu/pkgconfig before --libdir=lib was enforced.
for _pc_root_var in $(env | grep -E '^[A-Za-z][A-Za-z0-9_]*_ROOT=' | cut -d= -f1 | sort -u); do
  _pc_root="${!_pc_root_var}"
  for _pc_dir in "${_pc_root}/lib/pkgconfig" "${_pc_root}/share/pkgconfig" \
                 "${_pc_root}"/lib/*/pkgconfig; do
    [ -d "${_pc_dir}" ] || continue
    export PKG_CONFIG_PATH="${_pc_dir}${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"
  done
done
export C_INCLUDE_PATH="${CAIRO_ROOT:+${CAIRO_ROOT}/include}${C_INCLUDE_PATH:+:${C_INCLUDE_PATH}}"
export LIBRARY_PATH="${CAIRO_ROOT:+${CAIRO_ROOT}/lib}${LIBRARY_PATH:+:${LIBRARY_PATH}}"
[ "$(uname -s)" = "Darwin" ] && export CPPFLAGS="-I/opt/X11/include ${CPPFLAGS:-}" || true
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################

