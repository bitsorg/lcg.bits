package: netcdfc
description: netcdfc library/tool (from LCG software stack)
version: "4.9.3"
tag: "4.9.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/netcdf-c-4.9.3.tar.gz
requires:
  - curl
  - zlib
  - hdf5
  - m4
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
  ./configure --prefix=$INSTALLROOT "${netcdfc_CPPFLAGS}" "${netcdfc_LDFLAGS}"
}
