package: OpenSSL
description: OpenSSL toolkit for TLS/SSL and general cryptography
version: "3.0.19"
source: https://github.com/openssl/openssl
tag: "openssl-%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openssl-%(version)s.tar.gz
requires:
  - zlib
prefer_system: ".*"
# macOS: OpenSSL comes from Homebrew's keg-only openssl@3 (Apple ships no system
# headers). Listing it puts it in the generated Brewfile so bits --brew installs it;
# consumers point at `brew --prefix openssl@3`. Read only by the bits brew generator.
homebrew_formula: openssl@3
prefer_system_check: |
  #!/bin/bash -e
  case $(uname) in
    Darwin) prefix=$(brew --prefix openssl@3); [ -d "$prefix" ] ;;
    *) prefix= ;;
  esac
  cc -x c - ${prefix:+"-I$prefix/include"} -c -o /dev/null <<\EOF
  #include <openssl/bio.h>
  #include <openssl/opensslv.h>
  // Require OpenSSL >= 3.0.0. The stack has moved to OpenSSL 3 (e.g. curl 8.18
  // fails configure with "OpenSSL 3.0.0 or upper required"), so accepting the
  // 1.1.1 that el8/alma8 ships would take a too-old system copy and break
  // dependents. On el8 this makes bits build its own OpenSSL 3.x; el9/el10 and
  // modern Ubuntu already ship >= 3.0 and keep taking it from the system.
  #if OPENSSL_VERSION_NUMBER < 0x30000000L
  #error "System OpenSSL too old: need >= 3.0.0"
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
  # OpenSSL uses its own config script, not autotools, so Configure() is overridden
  # (Make/MakeInstall come from AutoToolsRecipe). Build shared libs with zlib;
  # --libdir=lib. macOS: name the target explicitly (./config mis-detects); Linux auto.
  case $(uname) in
    Darwin)
      case $(uname -m) in
        arm64) _target=darwin64-arm64-cc ;;
        *)     _target=darwin64-x86_64-cc ;;
      esac
      ./Configure "$_target" shared zlib -fPIC \
        --prefix="$INSTALLROOT" --openssldir="$INSTALLROOT/etc/openssl" --libdir=lib \
        ${ZLIB_ROOT:+-I${ZLIB_ROOT}/include -L${ZLIB_ROOT}/lib}
      ;;
    *)
      ./config shared zlib -fPIC \
        --prefix="$INSTALLROOT" --openssldir="$INSTALLROOT/etc/openssl" --libdir=lib \
        ${ZLIB_ROOT:+-I${ZLIB_ROOT}/include -L${ZLIB_ROOT}/lib}
      ;;
  esac
}
function MakeInstall() {
  # install_sw installs libs/headers/binaries without the slow man pages;
  # install_ssldirs installs the default openssl.cnf and cert directories.
  make install_sw install_ssldirs
}