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
  # readline is now a system dependency (see readline.sh): the bits build is
  # gone, so we use the OS readline, which R's configure finds in the default
  # /usr search paths. No READLINE_ROOT / CPPFLAGS / LDFLAGS overrides needed.
  ./configure --prefix=$INSTALLROOT --disable-R-framework --enable-R-shlib \
    --without-x --with-cairo --with-libpng --with-libtiff --with-jpeglib \
    --with-readline
}
