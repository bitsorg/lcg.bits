package: ofi
description: OFI (libfabric) high-performance fabric communication interface
version: "1.22.0"
tag: "1.22.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libfabric-1.22.0.tar.bz2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --enable-mlx=no --prefix=$INSTALLROOT
}
