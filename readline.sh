package: readline
description: GNU Readline command-line editing and history library
version: "HEAD"
tag: "master"
source: https://github.com/gnu-mirror-unofficial/readline.git
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  autoreconf -ivf
  ./configure --prefix="$INSTALLROOT"
}
