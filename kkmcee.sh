package: kkmcee
description: KKMC-ee Monte Carlo generator for e+e- annihilation
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/kkmcee-unknown.tar.gz
requires:
  - ROOT
  - photos++
  - hepmc3
  - autoconf
  - automake
  - libtool
build_requires:
  - bits-recipe-tools
license: LicenseRef-KKMC-ee
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  cmake -E create_symlink dizet-6.45 dizet
  autoreconf --force --install
  ./configure --with-photos=${photos___home} --prefix=$INSTALLROOT
}
