package: readline
description: GNU Readline command-line editing and history library
version: "8.0"
tag: "8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/readline-8.0.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
patches:
  - readline-8.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix="$INSTALLROOT" \
    CFLAGS="-Wno-error=incompatible-pointer-types -Wno-error=return-mismatch -Wno-old-style-definition"
}
