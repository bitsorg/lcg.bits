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
  - zstd
  - OpenSSL
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
  # sasl/gssapi require system libsasl2-dev which is not a bits package; omit them.
  ./configure --prefix="${INSTALLROOT}" \
    --enable-zlib \
    --enable-zstd \
    --enable-lz4 \
    --enable-lz4-ext \
    --enable-ssl \
    --disable-gssapi \
    --disable-sasl \
    CFLAGS="${CFLAGS} -I${LZ4_ROOT}/include -I${ZSTD_ROOT}/include -I${OPENSSL_ROOT}/include" \
    LDFLAGS="${LDFLAGS} -L${LZ4_ROOT}/lib -L${ZSTD_ROOT}/lib -L${OPENSSL_ROOT}/lib"
}
