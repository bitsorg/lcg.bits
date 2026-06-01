package: libxkbcommon
description: libxkbcommon X keyboard extension library
version: "0.7.1"
tag: "0.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - yacc-like
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # 0.7.1 builds the xkbcommon-x11 sub-library by default, which needs
  # xcb-xkb >= 1.10 / xorg-macros that are not in this stack.  This stack only
  # needs the core library, so disable X11 (and the doc build).
  #
  # gcc 15's stricter analysis turns warnings in this 2017-era code into hard
  # errors via the project's -Werror (e.g. -Warray-bounds in
  # src/xkbcomp/ast-build.c). Downgrade -Werror so the legacy code still builds;
  # user CFLAGS come last on the compile line, so this overrides the project's
  # earlier -Werror.
  ./configure --prefix="$INSTALLROOT" --disable-x11 --disable-docs \
    CFLAGS="${CFLAGS:-} -Wno-error"
}
