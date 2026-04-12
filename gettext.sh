package: gettext
description: GNU gettext internationalization and localization library
version: "0.24"
tag: "0.24"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gettext-0.24.tar.gz
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
  ./configure --prefix=$INSTALLROOT --without-xz --without-bzip2 --disable-curses --disable-openmp --enable-relocatable --disable-rpath --enable-nls --disable-native-java --disable-acl --disable-java --disable-dependency-tracking --disable-silent-rules --enable-static --enable-shared
}
