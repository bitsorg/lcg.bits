package: R
description: R statistical computing language and environment
version: "4.5.0"
tag: "4.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - fribidi
  - readline
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Use the bits readline (now linked against -ltinfo so its terminfo symbols
  # resolve). Point R's configure at it via CPPFLAGS/LDFLAGS. If readline still
  # cannot be found/linked, build without it: replace the readline lines with
  #   --without-readline
  # (R then builds fine, just without interactive command-line editing).
  ./configure --prefix=$INSTALLROOT --disable-R-framework --enable-R-shlib \
    --without-x --with-cairo --with-libpng --with-libtiff --with-jpeglib \
    --with-readline \
    CPPFLAGS="-I${READLINE_ROOT}/include ${CPPFLAGS:-}" \
    LDFLAGS="-L${READLINE_ROOT}/lib ${LDFLAGS:-}"
}
