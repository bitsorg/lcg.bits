package: libbpf
description: libbpf library/tool (from LCG software stack)
version: "1.5.0"
tag: "1.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libbpf-1.5.0.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  make ${JOBS:+-j $JOBS} -C src
  make ${JOBS:+-j $JOBS} DESTDIR=$INSTALLROOT -C src install COMMAND sed -i "s@/usr@$INSTALLROOT@" $INSTALLROOT/usr/lib64/pkgconfig/libbpf.pc COMMAND mv -f $INSTALLROOT/usr/lib64 $INSTALLROOT/ COMMAND mv -f $INSTALLROOT/usr/include $INSTALLROOT/ COMMAND rm -rf $INSTALLROOT/usr
}
