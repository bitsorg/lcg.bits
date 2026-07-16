package: motif
description: OSF/Motif — X11 widget toolkit (legacy)
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
  # Legacy X11/K&R C: gcc15 defaults to C23 and errors on K&R decls, bad pointers,
  # and implicit funcs. Build gnu17 -fcommon and downgrade those errors to warnings.
  ./configure --disable-printing --prefix "$INSTALLROOT" \
    CFLAGS="${CFLAGS:-} -std=gnu17 -fcommon -Wno-error -Wno-incompatible-pointer-types -Wno-implicit-function-declaration"
}

function Make() {
  # Skip demos: they reference X toolkit symbols libXm leaves undefined and don't
  # link -lX11. Blank demos/Makefile so the recursive build/install skips it.
  if [ -f demos/Makefile ]; then
    printf 'all:\ninstall:\ninstall-am:\ninstall-data:\ninstall-exec:\ncheck:\nclean:\n' > demos/Makefile
  fi
  make ${JOBS:+-j$JOBS}
}
