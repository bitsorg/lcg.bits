package: Qt5
description: Qt5 library/tool (from LCG software stack)
version: "5.15.15"
tag: "5.15.15"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/qt-everywhere-opensource-src-5.15.15.tar.gz
requires:
  - Python
  - fontconfig
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - Qt5-5.15.15.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ${qt_enable_standard} ./configure ${Qt5_extra_config_opts} -no-separate-debug-info -release --prefix=$INSTALLROOT -nomake examples -nomake tests --opensource --confirm-license
}
