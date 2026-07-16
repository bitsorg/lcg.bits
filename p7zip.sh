package: p7zip
description: p7zip port of 7-Zip archiver for POSIX systems
version: "16.02"
source: https://github.com/p7zip-project/p7zip
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/p7zip_16.02_src_all.tar.bz2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
patches:
  - p7zip-16.02.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Make() {
  make ${JOBS:+-j $JOBS} all2
}

function MakeInstall() {
  # install.sh creates wrapper scripts in bin/ that delegate to lib/p7zip/
  # Pass DEST_HOME so all paths land under $INSTALLROOT
  make install DEST_HOME="$INSTALLROOT"
}
