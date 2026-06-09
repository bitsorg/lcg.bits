package: m2crypto
description: M2Crypto Python wrapper for OpenSSL providing crypto and SSL toolkit
version: "0.45.1"
tag: "0.45.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - swig
  - OpenSSL
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--python"
##############################
function MakeInstall() {
  mkdir -p "${SITE_PACKAGES}"
  # setup.py reads OPENSSL_PATH and SWIG_LIB from the environment
  [[ -n "$OPENSSL_ROOT" ]] && export OPENSSL_PATH="$OPENSSL_ROOT"
  # macOS: OpenSSL is prefer_system (Homebrew keg-only openssl@3) with no
  # OPENSSL_ROOT exported, and macOS ships no system OpenSSL headers. M2Crypto's
  # setup.py preprocesses `openssl/x509_vfy.h` with `$CC -E` reading the include
  # path from $CFLAGS only (not from OPENSSL_PATH), so without it the step fails
  # ("gcc -E ended with return code 1"). Point OPENSSL_PATH at brew openssl@3 (for
  # the actual build_ext include/lib) and add its include/lib to CFLAGS/LDFLAGS
  # (for the preprocess probe and the link). Linux uses system OpenSSL on the
  # default paths, so this branch never runs there.
  if bits_is_macos; then
    _ossl=$(brew --prefix openssl@3 2>/dev/null) || _ossl=/opt/homebrew/opt/openssl@3
    export OPENSSL_PATH="$_ossl"
    export CFLAGS="-I${_ossl}/include${CFLAGS:+ ${CFLAGS}}"
    export LDFLAGS="-L${_ossl}/lib${LDFLAGS:+ ${LDFLAGS}}"
  fi
  if [[ -n "$SWIG_ROOT" ]]; then
    _swig_ver=$(swig -version 2>&1 | awk '/SWIG Version/{print $3}')
    export SWIG_LIB="$SWIG_ROOT/share/swig/$_swig_ver"
  fi
  "${PYTHON_EXE}" -m pip install \
    --no-deps --no-build-isolation --ignore-installed \
    --root=/ --prefix="${INSTALLROOT}" .
}
