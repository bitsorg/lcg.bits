package: openmpi
description: OpenMPI high-performance Message Passing Interface implementation
version: "4.1.8"
source: https://github.com/open-mpi/ompi
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
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
  # HWLOC_VERSION is exported by the hwloc modulefile and clashes with the
  # identically-named internal variable guarded by OPAL_VAR_SCOPE_PUSH.
  # Unset it so OpenMPI's configure can manage the name without conflicts.
  unset HWLOC_VERSION
  ./configure --prefix=$INSTALLROOT \
    --enable-mpi-cxx \
    --disable-dependency-tracking \
    --disable-silent-rules \
    --enable-ipv6 \
    --enable-mca-no-build=reachable-netlink \
    --with-hwloc=${hwloc_ROOT} \
    --with-libevent=${libevent_ROOT} \
    --with-sge
}
