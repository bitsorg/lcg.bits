package: valgrind
description: Valgrind dynamic analysis tool for memory and thread errors
version: "3.27.0"
tag: "3.27.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/valgrind-3.27.0.tar.bz2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  autoreconf --install --force
  chmod +x ./configure
  ./configure --prefix=$INSTALLROOT
}
function PostInstall() {
  printf 'setenv VALGRIND_LIB $PKG_ROOT/lib/valgrind\n' >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
}
