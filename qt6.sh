package: Qt6
description: Qt6 cross-platform application and UI framework
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
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only
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
