package: curl
description: Command-line tool and library for URL data transfer
version: "8.23.0"
source: https://github.com/curl/curl
tag: "curl-8_23_0"
# bits upgrade: no tarball of 8.21.0, built from the git tag
# sources:
#   - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - OpenSSL
  - zlib
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: curl
references:
  - cpe:2.3:a:haxx:curl:%(version)s
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
    [ -e configure ] || autoreconf -fi     # a git checkout has no generated configure
    ./configure --prefix="$INSTALLROOT" \
    --with-openssl \
    --with-gssapi --without-libidn2 --without-libpsl
}
