package: herwig
description: Herwig Monte Carlo event generator for high-energy collisions
version: "6.521.2"
tag: "6.521.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/herwig-6.521.2-src.tgz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
patches:
  - herwig-6.521.2.patch
env:
  HERWIG_INSTALL_PATH: "$HERWIG_ROOT/lib/herwig"
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --root-inc"
##############################
function Configure() {
  ./configure --prefix="$INSTALLROOT" \
    "FFLAGS=-O2 -fPIC -Wuninitialized -fno-automatic -fno-range-check" \
    F77=${FC:-gfortran} CC=$CC
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv HERWIG_ROOT $PKG_ROOT
setenv HERWIG_INSTALL_PATH $PKG_ROOT/lib/herwig
EOF
}
