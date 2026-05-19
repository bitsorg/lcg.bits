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
  rsync -a --delete --exclude '**/.git' "$SOURCEDIR"/ .
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
  make ${JOBS:+-j $JOBS} libuuid.la libuuid/uuid.pc install-uuidincHEADERS
}
function MakeInstall() {
  mkdir -p "$INSTALLROOT/lib" "$INSTALLROOT/share/pkgconfig"
  cp -a libuuid/uuid.pc "$INSTALLROOT/share/pkgconfig"
  cp -a .libs/libuuid.a* "$INSTALLROOT/lib" 2>/dev/null || true
  case $(uname) in
    Darwin) ;;
    *) cp -a .libs/libuuid.so* "$INSTALLROOT/lib" 2>/dev/null || true ;;
  esac
  rm -rf "$INSTALLROOT/man"
}
