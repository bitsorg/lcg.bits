package: curl
description: Command-line tool and library for URL data transfer
version: "8.18.0"
source: https://github.com/curl/curl
tag: "curl-8_18_0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - OpenSSL
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
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  # GSS-API/Kerberos requires krb5 (gssapi headers) to be present in the build
  # container — see the slc9-builder image, which installs krb5-devel.
  ./configure --prefix="$INSTALLROOT" \
    --with-openssl \
    --with-gssapi --without-libidn2 --without-libpsl
}
