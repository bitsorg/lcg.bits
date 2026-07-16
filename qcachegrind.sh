package: qcachegrind
description: QCachegrind GUI front-end for Cachegrind/Callgrind profiler
version: "20.12.1"
source: https://github.com/KDE/kcachegrind
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kcachegrind-20.12.1.tar.gz
requires:
  - Qt5
  # Valgrind has no Apple Silicon support; gate the requirement to non-osx so it
  # drops out of the macOS dep graph (the GUI still builds without it).
  - "valgrind:(?!osx)"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin"
##############################
function Make() {
  # The kcachegrind tarball contains both kcachegrind (needs KDE ECM) and
  # qcachegrind (plain Qt5 qmake build).  Build only the qcachegrind subdir.
  # Use a subshell so the cd does not change CWD for MakeInstall().
  (
    cd qcachegrind
    # macOS: Qt builds a .app bundle by default, so the plain qcachegrind binary
    # the install step expects is missing. CONFIG-=app_bundle emits a plain exe.
    _nobundle=""
    bits_is_macos && _nobundle="CONFIG-=app_bundle"
    "${QT5_ROOT}/bin/qmake" PREFIX="${INSTALLROOT}" ${_nobundle}
    make ${JOBS:+-j $JOBS}
  )
}
function MakeInstall() {
  install -d "${INSTALLROOT}/bin"
  install -m 755 qcachegrind/qcachegrind "${INSTALLROOT}/bin/qcachegrind"
}
