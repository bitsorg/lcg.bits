package: freetype
description: FreeType scalable font rendering engine
version: "2.14.3"
tag: "2.14.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/freetype-2.14.3.tar.gz
requires:
  - zlib
prefer_system: ".*"
prefer_system_check: |
  printf "#include <ft2build.h>\n" | c++ -xc++ - `freetype-config --cflags 2>/dev/null` `pkg-config freetype2 --cflags 2>/dev/null` -c -M 2>&1;
  if [ $? -ne 0 ]; then printf "FreeType is missing.\n * On RHEL-compatible systems: freetype freetype-devel\n * On Ubuntu-compatible systems: libfreetype6 libfreetype6-dev\n"; exit 1; fi

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: FTL OR GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix $INSTALLROOT --with-pic --with-png=no --with-bzip2=no --with-harfbuzz=no CC=$CC CFLAGS=-O
}
