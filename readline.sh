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
  # --with-curses forces readline to link against ncurses rather than the
  # bare termcap interface.  Without it, the linker may drop the ncurses
  # DT_NEEDED entry (--as-needed), leaving the terminfo globals (UP, BC, …)
  # unresolved in the shared library.  Those undefined symbols then cause
  # failures in unrelated programs (e.g. awk) that load libreadline.so via
  # LD_LIBRARY_PATH.
  ./configure --prefix="$INSTALLROOT" --enable-shared --with-curses
}
