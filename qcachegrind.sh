package: qcachegrind
description: QCachegrind GUI front-end for Cachegrind/Callgrind profiler
version: "20.12.1"
tag: "20.12.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kcachegrind-20.12.1.tar.gz
requires:
  - CMake
  - Qt5
  - valgrind
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  "${Qt5_ROOT}/bin/qmake"
  make ${JOBS:+-j $JOBS}
  make ${JOBS:+-j $JOBS} \
  && cmake -E make_directory $INSTALLROOT/bin
cmake
}
