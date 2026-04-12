package: zeromq
description: ZeroMQ high-performance asynchronous messaging library
version: "4.3.5"
tag: "4.3.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/zeromq-4.3.5.tar.gz
requires:
  - libsodium
  - pkg_config
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
  ./configure --prefix=$INSTALLROOT --with-libsodium=yes --disable-Werror
}
