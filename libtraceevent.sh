package: libtraceevent
description: libtraceevent library/tool (from LCG software stack)
version: "1.8.4"
tag: "1.8.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libtraceevent-1.8.4.tar.gz
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
  make ${JOBS:+-j $JOBS}
  make ${JOBS:+-j $JOBS} DESTDIR=$INSTALLROOT install COMMAND mv -f $INSTALLROOT/usr/local/lib64 $INSTALLROOT/ COMMAND mv -f $INSTALLROOT/usr/local/include $INSTALLROOT/ COMMAND sed -i "s@/usr/local@$INSTALLROOT@" $INSTALLROOT/usr/lib64/pkgconfig/libtraceevent.pc COMMAND sed -i "s@lib64@lib@" $INSTALLROOT/usr/lib64/pkgconfig/libtraceevent.pc COMMAND mv -f $INSTALLROOT/usr/lib64/pkgconfig $INSTALLROOT/lib64 # perf expects libtraceevent in lib, but if we don't have lib64 the plugin libs are not found when # libtraceevent is feature checked COMMAND ln -sf $INSTALLROOT/lib64 $INSTALLROOT/lib COMMAND rm -rf $INSTALLROOT/usr
}
