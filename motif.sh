package: motif
description: Motif tool for multi-omics data integration
version: "2.3.8"
tag: "2.3.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - fontconfig
  - flex
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
patches:
  - motif-2.3.8.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Motif is ancient X11 C code. gcc 15 defaults to C23 (an empty '()' now means
  # "no arguments", breaking K&R-style declarations -> "too many arguments to
  # function 'headerproc[abi]'") and promotes -Wincompatible-pointer-types to a
  # hard error. Build as gnu17 with -fcommon and downgrade those to warnings so
  # the legacy code (and its makestrs build tool) compile.
  #
  # The bundled libXpm sources (lib/Xpm) call strcpy/strncpy/strlen/strcmp
  # without including <string.h>; since gcc 14 an implicit function declaration
  # is an error by default (-Werror=implicit-function-declaration) regardless of
  # -std, and the blanket -Wno-error does not cover it in every sub-make. Add an
  # explicit -Wno-implicit-function-declaration so those legacy calls compile.
  ./configure --disable-printing --prefix "$INSTALLROOT" \
    CFLAGS="${CFLAGS:-} -std=gnu17 -fcommon -Wno-error -Wno-incompatible-pointer-types -Wno-implicit-function-declaration"
}
