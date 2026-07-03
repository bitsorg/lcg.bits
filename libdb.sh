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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--lib"
##############################
function Configure() {
  # macOS/libc++: BDB's atomic.h #defines a macro `atomic_init` that clobbers
  # libc++'s std::atomic_init (via <iostream> -> <atomic>). Every atomic_init in
  # BDB source is its own macro (never the stdlib one), so rename them all.
  if bits_is_macos; then
    for _f in $(grep -rl atomic_init src 2>/dev/null); do
      perl -i -pe 's/\batomic_init\b/__db_atomic_init/g' "$_f"
    done
  fi

  # Out-of-tree build from dist/configure. BDB 6.x uses K&R function definitions,
  # errors under GCC 15's default C23; force C11 and silence the warnings with
  # -Wno-old-style-definition.
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
