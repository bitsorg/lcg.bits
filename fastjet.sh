package: fastjet
description: FastJet package for jet finding in particle physics
version: "3.5.0"
source: https://github.com/fastjet/fastjet
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
patches:
  - fastjet-3.5.1-SharedPtr-gcc15.patch
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
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
