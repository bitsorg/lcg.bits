package: gmp
description: GNU Multiple Precision arithmetic library
version: "6.2.1"
tag: "6.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - m4
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later OR LGPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' "$SOURCEDIR"/ .

  # C23 compatibility fix (gcc 15+: void g(){} is no longer valid). Patch the
  # rsync'd copy in cwd (where ./configure runs), never the shared read-only
  # SOURCES tree.
  sed -i.orig 's/void g(){}/void g(int p1,t1 const* p2,t1 p3,t2 p4,t1 const* p5,int p6){}/' acinclude.m4 || true
  sed -i.orig 's/void g(){}/void g(int p1,t1 const* p2,t1 p3,t2 p4,t1 const* p5,int p6){}/' configure || true

  case $(uname -m) in
    x86_64) MARCH="core2" ;;
    *) MARCH="" ;;
  esac

  case $(uname) in
    Darwin)
      ./configure --prefix="$INSTALLROOT" --enable-cxx --disable-static --enable-shared \
        ${MARCH:+--build=$MARCH --host=$MARCH} --with-pic
      ;;
    *)
      ./configure --prefix="$INSTALLROOT" --enable-cxx --enable-static --disable-shared \
        ${MARCH:+--build=$MARCH --host=$MARCH} --with-pic
      ;;
  esac
}
function Make() {
  make ${JOBS:+-j $JOBS} MAKEINFO=:
}
function MakeInstall() {
  make install MAKEINFO=:
}
