package: Boost
description: Boost C++ portable peer-reviewed libraries
version: "1.90.0"
tag: "1.90.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/boost_1.90.0.tar.gz
requires:
  - zlib
  - xz
  - bzip2
build_requires:
  - bits-recipe-tools
license: BSL-1.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  $SOURCEDIR/bootstrap.sh ${Boost_bootstrap_options} --with-toolset=${Boost_toolset}
  $SOURCEDIR/b2 ${Boost_jam_options} --debug-configuration --toolset=${Boost_toolset} --user-config=$BUILDDIR/user-config.jam
  $SOURCEDIR/b2 ${Boost_jam_options} --toolset=${Boost_toolset} --prefix=$INSTALLROOT install --user-config=$BUILDDIR/user-config.jam
}
