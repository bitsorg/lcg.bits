package: soqt
description: SoQt Qt widget for OpenInventor/Coin3D
version: "1.5.0"
tag: "1.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/SoQt-1.5.0.tar.gz
requires:
  - coin3d
  - Qt6
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # bits exports dependency roots upper-cased (pkg_to_shell_id), so the Qt6 root
  # is $QT6_ROOT, not $Qt6_ROOT. With the wrong name QTDIR was empty and SoQt's
  # configure could not find the 'moc' pre-processor. Put Qt6's tool dir on PATH
  # as well so moc/uic/rcc are found regardless of the QTDIR layout.
  export PATH="${QT6_ROOT}/bin:${QT6_ROOT}/libexec:${PATH}"
  ./configure --prefix=$INSTALLROOT --enable-debug=no --enable-symbols=no \
    --with-coin="${COIN3D_ROOT}" --with-qt="${QT6_ROOT}" QTDIR="${QT6_ROOT}"
}
