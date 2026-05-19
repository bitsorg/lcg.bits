package: readline
description: GNU Readline command-line editing and history library
version: "8.3"
tag: "8.3"
sources:
  - ftp://ftp.cwru.edu/pub/bash/readline-8.3.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
patches:
  - readline-8.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
    ./configure --prefix="$INSTALLROOT" 
    #CFLAGS="-Wno-error=incompatible-pointer-types -Wno-error=return-mismatch -Wno-old-style-definition"
}
