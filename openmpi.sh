package: openmpi
description: OpenMPI high-performance Message Passing Interface implementation
version: "4.1.8"
tag: "4.1.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openmpi-4.1.8.tar.gz
requires:
  - libevent
  - hwloc
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --enable-mpi-cxx --disable-dependency-tracking --disable-silent-rules --enable-ipv6 --enable-mca-no-build=reachable-netlink --with-libevent=${lib} --with-sge
}
