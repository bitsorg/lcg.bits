package: linux_pam
description: linux_pam library/tool (from LCG software stack)
version: "1.5.1"
tag: "1.5.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Linux-PAM-1.5.1.tar.gz
requires:
  - bison
  - bzip2
  - flex
  - gettext
  - libxml2
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./autogen.sh COMMAND ./configure --disable-doc --prefix=$INSTALLROOT
}
