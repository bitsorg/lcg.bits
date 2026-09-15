package: gperftools
description: "Google Performance Tools: heap profiler, CPU profiler, tcmalloc"
version: "2.18.1"
source: https://github.com/gperftools/gperftools
tag: "gperftools-%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  # libunwind is Linux-oriented (GNU stack unwinding) and is disabled on
  # macOS; gate the requirement so it drops from the osx graph.
  - "libunwind:(?!osx)"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
# gperftools' CMake support is incomplete (compiles but installs no headers/libs),
# so use its native autotools build like lcgcmake/LCG does -- this installs
# libtcmalloc/libprofiler + gperftools/*.h into $INSTALLROOT.
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  $SOURCEDIR/configure --prefix=$INSTALLROOT CXX=$CXX \
    --enable-frame-pointers
}
