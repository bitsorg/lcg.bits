package: uuid
description: libuuid universally unique identifier library
version: "1.42"
tag: "1.42"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/e2fsprogs-1.42.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--lib --inc --pkgconfig"
##############################
function Configure() {
  case $(uname) in
    Darwin) DISABLE_SHARED="--disable-shared" ;;
    *) DISABLE_SHARED="" ;;
  esac
  # Avoid building docs
  GTKDOCIZE=echo autoreconf -ivf
  ./configure $DISABLE_SHARED \
    "--libdir=$INSTALLROOT/lib" \
    "--prefix=$INSTALLROOT" \
    --disable-all-programs \
    --disable-silent-rules \
    --disable-tls \
    --disable-nls \
    --disable-rpath \
    --without-ncurses \
    --enable-libuuid
}
function Make() {
  # e2fsprogs builds uuid inside lib/uuid; there is no top-level libuuid.la target.
  make ${JOBS:+-j $JOBS} -C lib/uuid
}
function MakeInstall() {
  mkdir -p "$INSTALLROOT/lib" "$INSTALLROOT/share/pkgconfig" "$INSTALLROOT/include/uuid"
  cp -a lib/uuid/uuid.pc "$INSTALLROOT/share/pkgconfig" 2>/dev/null || true
  cp -a lib/uuid/.libs/libuuid.a "$INSTALLROOT/lib" 2>/dev/null || true
  case $(uname) in
    Darwin) ;;
    *) cp -a lib/uuid/.libs/libuuid.so* "$INSTALLROOT/lib" 2>/dev/null || true ;;
  esac
  # Install uuid headers (e2fsprogs 1.42 lib/uuid/Makefile has no automake
  # install-uuidincHEADERS target; uuid.h is generated during Make() via "CP uuid.h").
  cp -a lib/uuid/uuid.h "$INSTALLROOT/include/uuid/"
}
