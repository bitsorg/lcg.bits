package: openmpi
description: openmpi library/tool (from LCG software stack)
version: "4.1.8"
tag: "4.1.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openmpi-4.1.8.tar.gz
requires:
  - libevent
  - hwloc
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
  ./configure --prefix=$INSTALLROOT --enable-mpi-cxx --disable-dependency-tracking --disable-silent-rules --enable-ipv6 --enable-mca-no-build=reachable-netlink --with-libevent=${lib} --with-sge
}
