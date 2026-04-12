package: syscalc
description: syscalc Monte Carlo event generator
version: "1.1.7"
tag: "1.1.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/sysCalc-1.1.7.tar.gz
requires:
  - lhapdf-${lhapdf6_latest_version}
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - syscalc-1.1.7.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  cmake -E remove -f $SOURCEDIR/sys_calc COMMAND cmake -E remove -f $SOURCEDIR/src/*.o COMMAND make ${JOBS:+-j $JOBS} all LHAPDF_HOME=${lhapdf_ROOT} BOOST_INCLUDE=${Boost_home_include} BOOST_HOME=${Boost_ROOT} "CXXFLAGS="
  cmake -DSRC=$SOURCEDIR -DDST=$INSTALLROOT -P # (lcgcmake-internal script removed)
}