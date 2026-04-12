package: openloops
description: OpenLoops one-loop matrix element generator
version: "2.1.2"
tag: "2.1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/OpenLoops-2.1.2.tar.gz
requires:
  - Python
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
  cmake
  ./openloops libinstall  --jobs=5 ${openloops_public_proc} compile_extra=1 ELSE BUILD_COMMAND ./openloops libinstall  --jobs=5 ${openloops_public_proc_arm} compile_extra=1  COMMAND bash -c "sed -i 's/^process_repositories.*/process_repositories = matrix,powheg,ATLAS/'  $SOURCEDIR/pyol/config/default.cfg" COMMAND ./openloops libinstall  --jobs=5 all.coll compile_extra=1 COMMAND bash -c "sed -i 's/^process_repositories.*/process_repositories = matrix,powheg,ATLAS,public/'  $SOURCEDIR/pyol/config/default.cfg" COMMAND ./openloops libinstall  --jobs=5 pphtt_nf compile_extra=1 COMMAND cmake -E remove_directory $SOURCEDIR/process_obj COMMAND cmake -E remove_directory $SOURCEDIR/process_src
  cmake -DSRC=$SOURCEDIR -DDST=$INSTALLROOT -P # (lcgcmake-internal script removed)
}