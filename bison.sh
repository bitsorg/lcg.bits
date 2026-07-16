package: bison
description: GNU Bison LALR/GLR parser generator
version: "3.8.2"
source: https://git.savannah.gnu.org/git/bison.git
tag: "v%(version)s"
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
  # --prefix was empty, so `make install` wrote to the host root (/bin, /share)
  # and failed with permission errors; install into the package prefix instead.
  # --enable-relocatable keeps bison finding its data dir relative to the binary.
  # Pass CC only when it is actually set (an empty CC= broke autodetection).
  ./configure --prefix="$INSTALLROOT" --enable-relocatable ${CC:+CC="$CC"}
}
