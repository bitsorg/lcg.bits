package: openloops
description: OpenLoops automated one-loop amplitude generator
version: "2.1.2"
tag: "2.1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/OpenLoops-2.1.2.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Prepare() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
}

function Make() {
  ./openloops libinstall --jobs=${JOBS:-5} ${openloops_public_proc} compile_extra=1
  sed -i 's/^process_repositories.*/process_repositories = matrix,powheg,ATLAS/' pyol/config/default.cfg
  ./openloops libinstall --jobs=${JOBS:-5} all.coll compile_extra=1
  sed -i 's/^process_repositories.*/process_repositories = matrix,powheg,ATLAS,public/' pyol/config/default.cfg
  ./openloops libinstall --jobs=${JOBS:-5} pphtt_nf compile_extra=1
  rm -rf process_obj process_src
}

function MakeInstall() {
  cp -a . "$INSTALLROOT/"
}