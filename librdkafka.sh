package: librdkafka
description: librdkafka library/tool (from LCG software stack)
version: "2.11.0"
tag: "2.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/librdkafka-2.11.0.tar.gz
requires:
  - zlib
  - curl
  - lz4
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
  ./configure --prefix=$INSTALLROOT --enable-zlib --enable-zstd --enable-lz4 --enable-lz4-ext --enable-ssl --enable-gssapi --enable-sasl
}
