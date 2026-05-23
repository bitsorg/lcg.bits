package: gettext
description: GNU gettext internationalisation and localisation library
version: "1.0"
tag: "1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT \
    --disable-acl \
    --disable-csharp \
    --disable-curses \
    --disable-d \
    --disable-dependency-tracking \
    --disable-java \
    --disable-native-java \
    --disable-openmp \
    --disable-rpath \
    --disable-silent-rules \
    --enable-nls \
    --enable-relocatable \
    --enable-shared \
    --enable-static \
    --without-bzip2 \
    --without-emacs \
    --without-selinux \
    --without-xz
}
function MakeInstall() {
  make install-exec
}
