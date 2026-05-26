package: fastjet
description: FastJet package for jet finding in particle physics
version: "3.5.2"
tag: "3.5.2"
sources:
  - https://fastjet.fr/repo/%(name)s-%(version)s.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --root-inc"
##############################
function Configure() {
  $SOURCEDIR/configure --prefix=$INSTALLROOT --enable-shared --enable-allplugins --disable-auto-ptr --enable-limited-thread-safety --enable-thread-safety --disable-silent-rules
}
function PostInstall() {
  printf 'setenv FASTJET $PKG_ROOT\n' >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
}
