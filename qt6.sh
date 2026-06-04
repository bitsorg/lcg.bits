package: Qt6
description: Qt6 cross-platform application and UI framework
version: "6.8.3"
mem_per_job: 1500
tag: "6.8.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/qt-everywhere-src-6.8.3.tar.xz
requires:
  - Python
  - fontconfig
  - html5lib
  - yacc-like
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
  # Mirror lcgcmake: skip qtwebengine (heavy, needs nodejs/html5lib and is the
  # source of the html5lib import error) and let configure find system .pc files.
  export PKG_CONFIG_PATH="/usr/share/pkgconfig:${PKG_CONFIG_PATH}"
  ./configure -no-separate-debug-info -release --prefix=$INSTALLROOT \
    -nomake examples -nomake tests --opensource --confirm-license \
    -skip qtwebengine
}

function Make() {
  # Qt 6.x generates a Ninja build, not a Makefile -- the default `make` step
  # fails with "No targets specified and no makefile found". Build with ninja.
  ninja ${JOBS:+-j$JOBS}
}

function MakeInstall() {
  ninja install
}
