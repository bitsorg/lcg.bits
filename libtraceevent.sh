package: libtraceevent
description: Linux kernel trace event parsing library
version: "1.8.4"
tag: "1.8.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libtraceevent-1.8.4.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  true  # libtraceevent uses plain make, no configure step
}
function Make() {
  make ${JOBS:+-j $JOBS}
}
function MakeInstall() {
  make ${JOBS:+-j $JOBS} DESTDIR=$INSTALLROOT install
  mv -f $INSTALLROOT/usr/local/lib64  $INSTALLROOT/
  mv -f $INSTALLROOT/usr/local/include $INSTALLROOT/
  # fix pkg-config paths
  sed -i "s@/usr/local@$INSTALLROOT@" \
    $INSTALLROOT/usr/lib64/pkgconfig/libtraceevent.pc
  sed -i "s@lib64@lib@" \
    $INSTALLROOT/usr/lib64/pkgconfig/libtraceevent.pc
  # perf expects libtraceevent in lib; keep lib64 for plugin discovery
  mv -f $INSTALLROOT/usr/lib64/pkgconfig $INSTALLROOT/lib64
  ln -sf $INSTALLROOT/lib64 $INSTALLROOT/lib
  rm -rf $INSTALLROOT/usr
}
