package: qcachegrind
description: QCachegrind GUI front-end for Cachegrind/Callgrind profiler
version: "20.12.1"
tag: "20.12.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kcachegrind-20.12.1.tar.gz
requires:
  - Qt5
  # Valgrind has no Apple Silicon support, so it cannot be built on macOS.
  # qcachegrind is its only consumer in the stack; gate the requirement to
  # non-osx so valgrind drops out of the macOS dependency graph entirely (the
  # GUI itself still builds, it just visualises callgrind output). Linux keeps it.
  - "valgrind:(?!osx)"
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
    # macOS: Qt builds a .app bundle by default (qcachegrind.app/Contents/MacOS/
    # qcachegrind), so the plain `qcachegrind/qcachegrind` the install step
    # expects does not exist ("No such file or directory"). CONFIG-=app_bundle
    # makes qmake emit a plain Unix executable instead. No-op on Linux.
    _nobundle=""
    [ "$(uname)" = Darwin ] && _nobundle="CONFIG-=app_bundle"
    "${QT5_ROOT}/bin/qmake" PREFIX="${INSTALLROOT}" ${_nobundle}
    make ${JOBS:+-j $JOBS}
  )
}
function MakeInstall() {
  install -d "${INSTALLROOT}/bin"
  install -m 755 qcachegrind/qcachegrind "${INSTALLROOT}/bin/qcachegrind"
}
