package: Qt6
description: Qt6 library/tool (from LCG software stack)
version: "6.8.3"
tag: "6.8.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/qt-everywhere-src-6.8.3.tar.xz
requires:
  - Python
  - fontconfig
  - html5lib
  - flex
  - bison
  - nodejs
  - zlib
  - ninja
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - Qt6-6.8.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure -no-separate-debug-info -release --prefix=$INSTALLROOT -nomake examples -nomake tests --opensource --confirm-license
}
