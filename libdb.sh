package: libdb
description: Oracle Berkeley DB embedded key-value database library
version: "6.2.23"
tag: "6.2.23"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/db-6.2.23.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: AGPL-3.0-only
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--lib"
##############################
function Configure() {
  # Berkeley DB requires an out-of-tree build from dist/configure.
  # Force C11 dialect: Berkeley DB 6.x uses K&R-style function definitions
  # throughout; GCC 15 treats these as errors in C23 (its default standard).
  # -Wno-old-style-definition suppresses the voluminous but harmless warnings.
  mkdir -p build_unix
  pushd build_unix
  CFLAGS="-std=gnu11 -Wno-old-style-definition -O2" \
  CXXFLAGS="-std=gnu++11 -O2" \
  ../dist/configure \
    --prefix="$INSTALLROOT" \
    --libdir="$INSTALLROOT/lib" \
    --enable-shared \
    --enable-cxx \
    --disable-static \
    --disable-java \
    --disable-tcl \
    --disable-replication \
    --with-pic
  popd
}

function Make() {
  make ${JOBS:+-j $JOBS} -C build_unix
}

function MakeInstall() {
  make -C build_unix install
  # Remove docs to keep install lean
  rm -rf "$INSTALLROOT/docs"
}
