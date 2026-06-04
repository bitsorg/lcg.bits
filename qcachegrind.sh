package: qcachegrind
description: QCachegrind GUI front-end for Cachegrind/Callgrind profiler
version: "20.12.1"
tag: "20.12.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kcachegrind-20.12.1.tar.gz
requires:
  - Qt5
  - valgrind
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Make() {
  # The kcachegrind tarball contains both kcachegrind (needs KDE ECM) and
  # qcachegrind (plain Qt5 qmake build).  Build only the qcachegrind subdir.
  # Use a subshell so the cd does not change CWD for MakeInstall().
  (
    cd qcachegrind
    "${QT5_ROOT}/bin/qmake" PREFIX="${INSTALLROOT}"
    make ${JOBS:+-j $JOBS}
  )
}
function MakeInstall() {
  install -d "${INSTALLROOT}/bin"
  install -m 755 qcachegrind/qcachegrind "${INSTALLROOT}/bin/qcachegrind"
}
