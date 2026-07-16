package: CMake
description: Cross-platform build system generator
version: "3.30.6"
source: https://gitlab.kitware.com/cmake/cmake
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cmake-%(version)s.tar.gz
requires:
  - OpenSSL
prefer_system: osx.*
prefer_system_check: |
  verge() { [[  "$1" = "$(echo -e "$1\n$2" | sort -V | head -n1)" ]]; }
  verle() { [[  "$1" = "$(echo -e "$1\n$2" | sort -V -r | head -n1)" ]]; }
  current_version=$(cmake --version | sed -e 's/.* //' | cut -d. -f1,2,3)
  echo bits_system_replace: cmake"$current_version"
  type cmake && verge 3.28.1 $current_version && verle 3.99.99 $current_version

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
# CMake must be built with its own bootstrap script (no `cmake` exists yet), so
# override the build steps to bootstrap + make. Build out-of-source from
# $SOURCEDIR so Prepare is a no-op (avoids copied headers colliding with build/).
function Prepare() { :; }

function Configure() {
  cat > build-flags.cmake <<EOF
SET(BUILD_TESTING OFF)
# ccmake's Curses dialog is not needed and drags in curses/tinfo.
SET(BUILD_CursesDialog FALSE CACHE BOOL "" FORCE)
EOF
  "$SOURCEDIR/bootstrap" --prefix="$INSTALLROOT" \
                         --init=build-flags.cmake \
                         ${JOBS:+--parallel=$JOBS}
}

function Make()        { make ${JOBS:+-j$JOBS}; }
function MakeInstall() { make install/strip; }
