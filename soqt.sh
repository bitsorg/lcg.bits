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
  # bits exports dep roots upper-cased (pkg_to_shell_id), so it's $QT6_ROOT; with
  # the wrong name QTDIR was empty and configure couldn't find 'moc'. Also put
  # Qt6's tool dir on PATH so moc/uic/rcc are found regardless of QTDIR layout.
  export PATH="${QT6_ROOT}/bin:${QT6_ROOT}/libexec:${PATH}"
  ./configure --prefix=$INSTALLROOT --enable-debug=no --enable-symbols=no \
    --with-coin="${COIN3D_ROOT}" --with-qt="${QT6_ROOT}" QTDIR="${QT6_ROOT}"
}
