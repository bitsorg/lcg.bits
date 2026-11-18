package: libnuma
description: libnuma NUMA memory policy and scheduling library
version: "2.0.19"
source: https://github.com/numactl/numactl
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/numactl-2.0.19.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure prefix=$INSTALLROOT
}
