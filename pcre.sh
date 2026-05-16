package: pcre
description: PCRE Perl-compatible regular expression library (v1)
version: "8.43"
tag: "8.43"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pcre-8.43.tar.gz
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --enable-utf --enable-jit --enable-unicode-properties --prefix=$INSTALLROOT
}
