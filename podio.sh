package: podio
description: Plain Old Data I/O library for HEP event data models
version: "01.07"
source: https://github.com/AIDASoft/podio
mem_per_job: 1500
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - ROOT
  - Python
  - PyYAML
  - tabulate
  - graphviz
  - fmt
  # optional:
  # - SIO
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --root-inc"
##############################
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=${CXXSTD:-20} \
    -DENABLE_DATASOURCE=ON \
    -DBUILD_TESTING=OFF
}
function PostInstall() {
  for _sp in "$INSTALLROOT"/lib*/python*/site-packages; do
    if [ -d "$_sp" ]; then
      echo "prepend-path PYTHONPATH \$PKG_ROOT/${_sp#$INSTALLROOT/}" >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
    fi
  done
  # The pythonizations JIT-include Python.h.
  _pyxy=$("${PYTHON_ROOT:-/nonexistent}/bin/python3" -c 'import sys; print("%d.%d" % sys.version_info[:2])' 2>/dev/null || true)
  if [ -n "$_pyxy" ] && [ -d "$PYTHON_ROOT/include/python$_pyxy" ]; then
    echo "prepend-path ROOT_INCLUDE_PATH \$::env(PYTHON_ROOT)/include/python$_pyxy" >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
  fi
}
