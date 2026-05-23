package: libxslt
description: libxslt XSLT C library for GNOME
version: "%(tag_basename)s"
tag: "v1.1.43"
source: https://gitlab.gnome.org/GNOME/libxslt.git
#sources:
#  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
#patches:
#  - %(name)s-%(version)s.patch
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
    autoreconf -i
   ./configure --prefix="$INSTALLROOT" --with-zlib="${ZLIB_ROOT}" --without-python
}
