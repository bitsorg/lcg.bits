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
  # macOS ships an ancient /usr/bin/bison (2.3, 2008) that cannot parse
  # libxkbcommon's parser.y ("syntax error, unexpected type"). On Linux a modern
  # bison comes from GCC-Toolchain (osx-disabled above); on macOS pull in the
  # bits bison so a current bison is first on PATH for the YACC step.
  - "bison:osx"
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
  ./configure --prefix="$INSTALLROOT" --disable-x11 --disable-docs

  # gcc 15's stricter analysis turns warnings in this 2017-era code into hard
  # errors (e.g. -Warray-bounds in src/xkbcomp/ast-build.c). The build hard-codes
  # per-warning '-Werror=...' flags into the makefiles *after* CFLAGS, so a
  # CFLAGS=-Wno-error cannot override them. Strip every -Werror* token from the
  # generated makefiles so those (false-positive) warnings stay non-fatal.
  find . -name Makefile -exec perl -i -pe 's/-Werror[^[:space:]]*//g' {} +
}
