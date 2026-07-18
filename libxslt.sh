package: libxslt
description: libxslt XSLT C library for GNOME
version: "%(tag_basename)s"
tag: "v1.1.43"
source: https://gitlab.gnome.org/GNOME/libxslt.git
requires:
  - libxml2
  - zlib
prefer_system: ".*"
prefer_system_check:

build_requires:
  - "autotools:(slc6|slc7)"
  - "GCC-Toolchain:(?!osx)"
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
    # libxslt v1.1.43's configure.ac (l.70) pins Automake 1.16.3 via
    # AM_INIT_AUTOMAKE([1.16.3 ...]); the el9/el10 build images ship 1.16.2 and
    # the bump is not backed by any 1.16.3-only feature. Relax the requirement to
    # the Automake actually installed rather than pull a whole autotools build in.
    am_ver=$(automake --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?' | head -1)
    [ -n "$am_ver" ] && sed -i -E "s/(AM_INIT_AUTOMAKE\(\[?)[0-9]+\.[0-9]+(\.[0-9]+)?/\1$am_ver/" configure.ac
    autoreconf -i
   ./configure --prefix="$INSTALLROOT" --with-zlib="${ZLIB_ROOT}" --without-python
}
