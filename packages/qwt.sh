package: qwt
description: Qt Widgets for Technical Applications (Qwt)
version: "6.0.1"
source: https://github.com/uwerat/qwt
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.bz2
requires:
  - Qt6
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
patches:
  - qwt-6.0.1.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  # bits exports dependency roots upper-cased (pkg_to_shell_id), so the Qt6
  # package's root is $QT6_ROOT, not $Qt6_ROOT. With the wrong name the variable
  # was empty and qmake resolved to "/bin/qmake" (No such file or directory).
  "${QT6_ROOT}/bin/qmake" QWT_INSTALL_PREFIX="$INSTALLROOT"
  make ${JOBS:+-j $JOBS}
  make install
}
function MakeInstall() { true; }  # install folded into Make()
