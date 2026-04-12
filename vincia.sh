package: vincia
description: vincia Monte Carlo event generator
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/vincia-unknown.tgz
requires:
  - pythia8
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
  $SHELL -c "cp -rf ${pythia8_ROOT}/config.mk $SOURCEDIR/" COMMAND $SHELL -c "sed -i.bak -e 's/make -C$(PYTHIA8)//g' -e 's/make -C$(PY8DIR)//g' $SOURCEDIR/Makefile"
  make PYTHIA8=${pythia8_ROOT} PY8DIR=${pythia8_ROOT}
  cmake -DSRC=$SOURCEDIR/lib -DDST=$INSTALLROOT/lib -P # (lcgcmake-internal script removed) COMMAND cmake -DSRC=$SOURCEDIR/bin -DDST=$INSTALLROOT/bin -P # (lcgcmake-internal script removed) COMMAND cmake -DSRC=$SOURCEDIR/tunes -DDST=$INSTALLROOT/tunes -P # (lcgcmake-internal script removed) COMMAND cmake -DSRC=$SOURCEDIR/include -DDST=$INSTALLROOT/include -P # (lcgcmake-internal script removed) COMMAND cmake -DSRC=$SOURCEDIR/data -DDST=$INSTALLROOT/data -P # (lcgcmake-internal script removed) COMMAND cmake -DSRC=$SOURCEDIR/antennae -DDST=$INSTALLROOT/antennae -P # (lcgcmake-internal script removed) COMMAND cmake -DSRC=$SOURCEDIR/xmldoc -DDST=$INSTALLROOT/xmldoc -P # (lcgcmake-internal script removed) ELSE
}