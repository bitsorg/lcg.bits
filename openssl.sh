package: OpenSSL
description: OpenSSL toolkit for TLS/SSL and general cryptography
version: "3.0.19"
tag: "3.0.19"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/openssl-3.0.19.tar.gz
requires:
  - zlib
prefer_system: ".*"
# macOS: OpenSSL comes from Homebrew's keg-only openssl@3 (Apple ships no system
# OpenSSL headers). Listing it here puts it in the generated Brewfile so
# `brew bundle` / `bits --brew` installs it; consumers that need its headers
# (e.g. Frontier_Client) point at `brew --prefix openssl@3`. No effect on the
# build logic — `homebrew_formula` is only read by the `bits brew` generator.
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
  # OpenSSL uses its own config script, not autotools, so Configure() is
  # overridden (Make/MakeInstall come from AutoToolsRecipe). Build shared libs
  # with zlib support; --libdir=lib keeps artefacts under lib (not lib64).
  # On macOS ./config mis-detects the target, so name it explicitly; on Linux
  # ./config auto-detects the platform.
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