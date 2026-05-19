package: OpenSSL
description: OpenSSL toolkit for TLS/SSL and general cryptography
version: "3.0.19"
tag: "3.0.19"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openssl-3.0.19.tar.gz
requires:
  - zlib
prefer_system: ".*"
prefer_system_check: |
  #!/bin/bash -e
  case $(uname) in
    Darwin) prefix=$(brew --prefix openssl@3); [ -d "$prefix" ] ;;
    *) prefix= ;;
  esac
  cc -x c - ${prefix:+"-I$prefix/include"} -c -o /dev/null <<\EOF
  #include <openssl/bio.h>
  #include <openssl/opensslv.h>
  #if OPENSSL_VERSION_NUMBER < 0x10101000L
  #error "System OpenSSL too old: need >= 1.1.1"
  #endif
  int main() { }
  EOF

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --root-inc --pkgconfig"
##############################
function Configure() {
  # platform-conditional: ./Configure darwin64-""-cc ELSE ./config no-shared -fPIC  --prefix=$INSTALLROOT --openssldir=$INSTALLROOT/etc/openssl -I${ZLIB_ROOT}/include -L${ZLIB_ROOT}/lib
}