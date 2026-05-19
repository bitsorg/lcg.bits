package: vincia
description: VINCIA antenna shower plugin for Pythia 8
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/vincia-unknown.tgz
requires:
  - pythia8
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  $SHELL -c "cp -rf ${pythia8_ROOT}/config.mk $SOURCEDIR/"
  $SHELL -c "sed -i.bak -e 's/make -C$(PYTHIA8)//g' -e 's/make -C$(PY8DIR)//g' $SOURCEDIR/Makefile"
  make PYTHIA8=${pythia8_ROOT} PY8DIR=${pythia8_ROOT}
  for d in lib bin tunes include data antennae xmldoc; do
    [ -d $SOURCEDIR/$d ] && rsync -a $SOURCEDIR/$d/ $INSTALLROOT/$d/
  done
}