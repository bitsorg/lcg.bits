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
  # mklove configure honours CFLAGS/LDFLAGS as env vars, not positional args.
  # Guard each root so empty values don't inject bare -I/ or -L/ flags.
  local _inc="" _lib=""
  for _root in "${LZ4_ROOT}" "${ZSTD_ROOT}" "${OPENSSL_ROOT}"; do
    [ -n "${_root}" ] && _inc="${_inc} -I${_root}/include" && _lib="${_lib} -L${_root}/lib"
  done
  CFLAGS="${CFLAGS}${_inc}" \
  LDFLAGS="${LDFLAGS}${_lib}" \
  ./configure --prefix="${INSTALLROOT}" \
    --enable-zlib \
    --enable-zstd \
    --enable-lz4-ext \
    --enable-ssl \
    --disable-gssapi \
    --disable-sasl
}
