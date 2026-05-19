package: libevent
description: libevent asynchronous event notification library
version: "2.1.11"
tag: "2.1.11"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libevent-2.1.11.tar.gz
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
  ./configure --prefix $INSTALLROOT
}
