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
  # Ancient X11 K&R C: gcc15/C23 makes empty () mean "no args" and promotes
  # incompatible-pointer-types + implicit-function-declaration to errors. Build
  # as gnu17 -fcommon and downgrade those diagnostics so the legacy code (and
  # bundled libXpm, which uses str* without <string.h>) compiles.
  ./configure --disable-printing --prefix "$INSTALLROOT" \
    CFLAGS="${CFLAGS:-} -std=gnu17 -fcommon -Wno-error -Wno-incompatible-pointer-types -Wno-implicit-function-declaration"
}

function Make() {
  # Skip the demo programs (--bin --lib only): they use X toolkit symbols
  # (XFillArc) without linking -lX11, so they fail to link. Neutralise demos/.
  if [ -f demos/Makefile ]; then
    printf 'all:\ninstall:\ninstall-am:\ninstall-data:\ninstall-exec:\ncheck:\nclean:\n' > demos/Makefile
  fi
  make ${JOBS:+-j$JOBS}
}
