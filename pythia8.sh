package: pythia8
description: Pythia 8 Monte Carlo event generator for high-energy physics
version: "306"
tag: "306"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/pythia8306.tgz
requires:
  - lhapdf
  - zlib
  - Python
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
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT --with-lhapdf6=${lhapdf_ROOT} --enable-shared --with-python-config=${Python_ROOT}/bin/python-config
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'MODEOF'
setenv PYTHIA8 $PKG_ROOT
setenv PYTHIA8DATA $PKG_ROOT/share/Pythia8/xmldoc
MODEOF
}
