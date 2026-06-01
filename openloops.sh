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
# Excludes so the downloaded source archive and bits' extraction/patch sentinels
# never reach the build copy or the install tree (this recipe installs by copying
# the whole tree).  Archive patterns are root-anchored.
_BITS_SRC_EXCLUDES=(
  --exclude '.bits_extracted' --exclude '.bits_patched' --exclude '*.downloading'
  --exclude '/*.tar'     --exclude '/*.tar.gz'  --exclude '/*.tgz'
  --exclude '/*.tar.bz2' --exclude '/*.tbz2'    --exclude '/*.tar.xz' --exclude '/*.txz'
  --exclude '/*.tar.zst' --exclude '/*.zip'
)
function Prepare() {
  rsync -av --delete --exclude '**/.git' "${_BITS_SRC_EXCLUDES[@]}" --delete-excluded "${SOURCEDIR}"/ ./
}

function Make() {
  # Build the main OpenLoops library (libopenloops.so) first. lcgcmake runs
  # ./scons before any libinstall; without it only the process libraries are
  # produced and consumers (herwig3, whizard, sherpa) fail with
  # "libopenloops.so ... not found".
  ./scons
  ./openloops libinstall --jobs=${JOBS:-5} ${openloops_public_proc} compile_extra=1
  sed -i 's/^process_repositories.*/process_repositories = matrix,powheg,ATLAS/' pyol/config/default.cfg
  ./openloops libinstall --jobs=${JOBS:-5} all.coll compile_extra=1
  sed -i 's/^process_repositories.*/process_repositories = matrix,powheg,ATLAS,public/' pyol/config/default.cfg
  ./openloops libinstall --jobs=${JOBS:-5} pphtt_nf compile_extra=1
  rm -rf process_obj process_src
}

function MakeInstall() {
  # rsync -a (== cp -a semantics) but lets us drop the source archive/sentinels.
  mkdir -p "$INSTALLROOT"
  rsync -a --exclude '**/.git' "${_BITS_SRC_EXCLUDES[@]}" --delete-excluded ./ "$INSTALLROOT/"
}