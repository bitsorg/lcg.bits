package: blackhat
description: blackhat Monte Carlo event generator
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/blackhat-unknown.tar.gz
requires:
  - qd
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
  ./configure --prefix=$INSTALLROOT --with-QDpath=${qd_ROOT} "CFLAGS=-O2 -g0 -fpermissive" "CXXFLAGS=-O2 -g0 -fpermissive" "FFLAGS=-O2 -g0 -fpermissive" PYTHON=${Python_ROOT}/bin/python3 ${library_path}=${Python_ROOT}/lib:$ENV{${library_path}} PYTHONPATH=${Python_ROOT}/lib/python${Python_config_version_twodigit}/site-packages:$PYTHONPATH
}