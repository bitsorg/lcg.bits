package: librdkafka
description: librdkafka high-performance Apache Kafka C/C++ library
version: "2.11.0"
tag: "2.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - zlib
  - curl
  - lz4
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
  ./configure --prefix=$INSTALLROOT --enable-zlib --enable-zstd --enable-lz4 --enable-lz4-ext --enable-ssl --enable-gssapi --enable-sasl
}
