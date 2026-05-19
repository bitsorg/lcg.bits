package: openloops
description: OpenLoops automated one-loop amplitude generator
version: "2.1.2"
tag: "2.1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/OpenLoops-2.1.2.tar.gz
requires:
  - CMake
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./openloops libinstall  --jobs=5 ${openloops_public_proc} compile_extra=1  \
  && bash -c "sed -i 's/^process_repositories.*/process_repositories = matrix,powheg,ATLAS/' $SOURCEDIR/pyol/config/default.cfg" \
  && ./openloops libinstall --jobs=5 all.coll compile_extra=1 \
  && bash -c "sed -i 's/^process_repositories.*/process_repositories = matrix,powheg,ATLAS,public/' $SOURCEDIR/pyol/config/default.cfg" \
  && ./openloops libinstall --jobs=5 pphtt_nf compile_extra=1 \
  && cmake -E remove_directory $SOURCEDIR/process_obj \
  && cmake -E remove_directory $SOURCEDIR/process_src
  rsync -a $SOURCEDIR/ $INSTALLROOT/
}