package: GENIE
description: GENIE Monte Carlo event generator
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/GENIE-unknown.tar.bz2
requires:
  - ROOT
  - lhapdf-${lhapdf5_latest_version}
  - pythia6
  - log4cpp
  - GSL
  - libxml2
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  $SHELL -c "export ROOTSYS=${ROOT_ROOT} GENIE=\$PWD PATH=${ROOT_ROOT}/bin:\$PATH && ./configure --prefix=$INSTALLROOT --enable-lhapdf --enable-validation-tools --enable-test --enable-numi --enable-atmo --enable-nucleon-decay --enable-rwght --enable-pythia6 --enable-mathmore --with-pythia6-lib=${pythia6_ROOT}/lib --with-lhapdf-lib=${lhapdf-${lhapdf5_latest_version}_home}/lib --with-lhapdf-inc=${lhapdf-${lhapdf5_latest_version}_home}/include --with-log4cpp-inc=${log4cpp_ROOT}/include --with-log4cpp-lib=${log4cpp_ROOT}/lib --with-libxml2-lib=${libxml2_ROOT}/lib --with-libxml2-inc=${libxml2_ROOT}/include/libxml2"
}