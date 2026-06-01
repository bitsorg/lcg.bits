package: libbpf
description: Linux BPF (Berkeley Packet Filter) library
version: "1.5.0"
tag: "1.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only OR BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  make ${JOBS:+-j $JOBS} -C src
  make ${JOBS:+-j $JOBS} DESTDIR=$INSTALLROOT -C src install \
  && sed -i "s@/usr@$INSTALLROOT@" $INSTALLROOT/usr/lib64/pkgconfig/libbpf.pc \
  && mv -f $INSTALLROOT/usr/lib64 $INSTALLROOT/ \
  && mv -f $INSTALLROOT/usr/include $INSTALLROOT/ \
  && rm -rf $INSTALLROOT/usr
}

function MakeInstall() {
  # The install (make -C src install) is done in Make() above; libbpf's
  # top-level Makefile has no 'install' target, so the MakeRecipe default
  # (make install) would fail. Nothing more to do here.
  true
}
