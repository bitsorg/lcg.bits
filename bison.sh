package: bison
description: GNU Bison LALR/GLR parser generator
version: "3.8.2"
tag: "3.8.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - m4
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  # --prefix into the package root (empty prefix wrote to host /bin, /share).
  # --enable-relocatable keeps bison finding its data dir relative to the binary.
  # Pass CC only when set (empty CC= broke autodetection).
  ./configure --prefix="$INSTALLROOT" --enable-relocatable ${CC:+CC="$CC"}
}
