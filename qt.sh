package: Qt
description: Qt cross-platform application and UI framework
version: "4.8.7"
tag: "4.8.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/qt-everywhere-opensource-src-4.8.7.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - Qt-4.8.7.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ${qt_enable_standard} ./configure ${Qt_extra_config_opts} -no-separate-debug-info -release --prefix=$INSTALLROOT -nomake examples -nomake demos -no-phonon --opensource --confirm-license -fast -qt3support
}
