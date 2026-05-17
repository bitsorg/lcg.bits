package: curl
description: Command-line tool and library for URL data transfer
version: "8.18.0"
tag: "8.18.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/curl-8.18.0.tar.gz
requires:
  - zlib
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: curl
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --with-gssapi --without-libidn2 --without-libpsl
}
