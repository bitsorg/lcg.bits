package: pythia8
description: Pythia 8 Monte Carlo event generator for high-energy physics
version: "317"
mem_per_job: 1500
tag: "317"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/pythia8317.tgz
requires:
  - lhapdf
  - zlib
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
env:
  PYTHIA8: "$PYTHIA8_ROOT"
  PYTHIA8DATA: "$PYTHIA8_ROOT/share/Pythia8/xmldoc"
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --root-inc"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --with-lhapdf6=${LHAPDF_ROOT} --enable-shared --with-python-config=${Python_ROOT}/bin/python-config
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'MODEOF'
setenv PYTHIA8 $PKG_ROOT
setenv PYTHIA8DATA $PKG_ROOT/share/Pythia8/xmldoc
MODEOF
}
