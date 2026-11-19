package: umesimd
description: "UME::SIMD explicit SIMD vector programming library"
version: "0.8.1"
source: https://github.com/edanor/umesimd.git
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tgz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--inc"
##############################
function Make() {
  make ${JOBS:+-j $JOBS}
  mkdir -p "$INSTALLROOT/include/umesimd"
  # Header-only install: copy the source tree but drop the downloaded archive and bits'
  # extraction/patch sentinels (else they land in the install tree). Archive patterns are
  # root-anchored so only the top-level download is dropped.
  rsync -a --exclude '**/.git' \
    --exclude '.bits_extracted' --exclude '.bits_patched' --exclude '*.downloading' \
    --exclude '/*.tgz' --exclude '/*.tar' --exclude '/*.tar.gz' \
    --exclude '/*.tar.bz2' --exclude '/*.tar.xz' --exclude '/*.zip' \
    "$SOURCEDIR"/ "$INSTALLROOT/include/umesimd/"
}
