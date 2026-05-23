package: alpgen
description: ALPGEN leading-order multi-parton matrix-element event generator
version: "2.1.4"
tag: "2.1.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s_v214.tgz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-Alpgen
patches:
  - %(name)s-%(version)s.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Prepare() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # alputi.f has trailing whitespace on the &,NHIST context lines that makes
  # patch refuse the hunks; apply these two trivial substitutions via sed instead.
  sed -i 's/CHARACTER TITLE\*25,BOOK\*3,NOW\*24/CHARACTER TITLE*25,BOOK*3,NOW*25/' alplib/alputi.f
  sed -i 's/CHARACTER TITLE\*25,BOOK\*3,SCALE\*3,NOW\*24/CHARACTER TITLE*25,BOOK*3,SCALE*3,NOW*25/' alplib/alputi.f
}

function Make() {
  make ${JOBS:+-j $JOBS} all
}
