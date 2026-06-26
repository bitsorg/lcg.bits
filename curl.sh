package: curl
description: Command-line tool and library for URL data transfer
version: "8.18.0"
tag: "8.18.0"
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
  # GSS-API/Kerberos is disabled: the build environment ships no krb5 dev
  # library, and ROOT's use of curl does not need SPNEGO/Kerberos auth. Use
  # --without-gssapi explicitly so detection is deterministic regardless of
  # what happens to be present in the container.
  ./configure --prefix="$INSTALLROOT" \
    --with-openssl \
    --without-gssapi --without-libidn2 --without-libpsl
}
