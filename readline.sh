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
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  [ -f autogen.sh ] && ./autogen.sh
  # Stopgap so the bits libreadline.so is not broken (the stack otherwise prefers
  # the system readline).  --with-curses selects ncurses over the bare termcap
  # interface; SHLIB_LIBS controls what is linked INTO the shared object, so
  # forcing -lncurses there (plus LIBS for the static/test side) puts ncurses in
  # libreadline.so's DT_NEEDED.  Without it the terminfo globals (UP, BC, PC, …)
  # are left unresolved and any program that loads readline via LD_LIBRARY_PATH
  # (e.g. the system awk used in autoconf configure probes) crashes with
  # "symbol lookup error: … undefined symbol: UP".
  # The unresolved terminfo globals (UP, BC, PC, …) live in libtinfo on modern
  # split-ncurses systems (Debian/Ubuntu), not in libncurses, so -lncurses alone
  # leaves them undefined. Add -ltinfo so libreadline.so carries the terminfo
  # symbols (and a correct DT_NEEDED) and programs loading it don't crash with
  # "undefined symbol: UP".
  ./configure --prefix="$INSTALLROOT" --enable-static -q --with-curses \
    SHLIB_LIBS="-lncurses -ltinfo" LIBS="-lncurses -ltinfo"
}
