package: libtraceevent
description: Linux kernel trace event parsing library
version: "1.8.4"
source: https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
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
  perl -i -pe "s@/usr/local@$INSTALLROOT@" \
    $INSTALLROOT/usr/lib64/pkgconfig/libtraceevent.pc
  perl -i -pe "s@lib64@lib@" \
    $INSTALLROOT/usr/lib64/pkgconfig/libtraceevent.pc
  # perf expects libtraceevent in lib; keep lib64 for plugin discovery
  mv -f $INSTALLROOT/usr/lib64/pkgconfig $INSTALLROOT/lib64
  ln -sf $INSTALLROOT/lib64 $INSTALLROOT/lib
  rm -rf $INSTALLROOT/usr
}
