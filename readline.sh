package: readline
description: GNU Readline command-line editing and history library
version: "8.3"
tag: "8.3"
sources:
  - https://ftp.gnu.org/gnu/%(name)s/%(name)s-%(version)s.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
prepend_path:
  PKG_CONFIG_PATH: "$READLINE_ROOT/lib/pkgconfig"
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  [ -f autogen.sh ] && ./autogen.sh
  ./configure --prefix="$INSTALLROOT" --enable-shared 
}
