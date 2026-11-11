package: libxkbcommon
description: libxkbcommon X keyboard extension library
version: "0.8.1"
tag: "xkbcommon-%(version)s"
sources:
  - https://xkbcommon.org/download/%(name)s-%(version)s.tar.xz
#  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - yacc-like
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
  # macOS /usr/bin/bison (2.3) can't parse parser.y; pull in a current bits
  # bison so it's first on PATH for the YACC step.
  - "bison:osx"
license: MIT
references:
  - cpe:2.3:a:xkbcommon:libxkbcommon:%(version)s
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # xkbcommon-x11 needs xcb-xkb>=1.10/xorg-macros not in this stack; only the
  # core library is needed, so disable X11 (and docs).
  ./configure --prefix="$INSTALLROOT" --disable-x11 --disable-docs
  # gcc15 makes -Warray-bounds etc. fatal; the build hard-codes -Werror=* after
  # CFLAGS so -Wno-error can't override. Strip -Werror* from generated makefiles.
  find . -name Makefile -exec perl -i -pe 's/-Werror[^[:space:]]*//g' {} +
}
