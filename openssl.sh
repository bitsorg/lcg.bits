package: openssl
description: OpenSSL toolkit for TLS/SSL and general cryptography
version: "3.0.19"
tag: "3.0.19"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openssl-3.0.19.tar.gz
requires:
  - zlib
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  # platform-conditional: ./Configure darwin64-""-cc ELSE ./config no-shared -fPIC  --prefix=$INSTALLROOT --openssldir=$INSTALLROOT/etc/openssl -I${zlib_ROOT}/include -L${zlib_ROOT}/lib
}