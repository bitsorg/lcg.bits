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
##############################
MODULE_OPTIONS="--python"
##############################
function MakeInstall() {
  mkdir -p "${SITE_PACKAGES}"
  # setup.py reads OPENSSL_PATH and SWIG_LIB from the environment
  [[ -n "$OPENSSL_ROOT" ]] && export OPENSSL_PATH="$OPENSSL_ROOT"
  if [[ -n "$SWIG_ROOT" ]]; then
    _swig_ver=$(swig -version 2>&1 | awk '/SWIG Version/{print $3}')
    export SWIG_LIB="$SWIG_ROOT/share/swig/$_swig_ver"
  fi
  "${PYTHON_EXE}" -m pip install \
    --no-deps --no-build-isolation --ignore-installed \
    --root=/ --prefix="${INSTALLROOT}" .
}
