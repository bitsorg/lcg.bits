package: looptools
description: LoopTools library for Passarino-Veltman one-loop integrals
version: "2.15"
tag: "2.15"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/LoopTools-2.15.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
patches:
  - looptools-2.15.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' "$SOURCEDIR"/ .
  case $(uname -m) in
    x86_64) EXTRA_FLAGS="--64" ;;
    *) EXTRA_FLAGS="" ;;
  esac
  ./configure --prefix="$INSTALLROOT" ${EXTRA_FLAGS} "FFLAGS=-fPIC -std=legacy" CFLAGS=-fPIC
}
function PostInstall() {
  printf 'setenv LOOPTOOLS_ROOT $PKG_ROOT\n' >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
}
