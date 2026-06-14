package: pandorapfa
description: PandoraPFA particle flow algorithm for calorimeter reconstruction
version: "04.11.02"
tag: "04.11.02"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
patches:
  - pandorapfa-04.11.02.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
function Configure() {
  # PandoraSDK's CMakeLists forces -Werror, appending incoming flags last; the
  # superbuild forwards CMAKE_CXX_FLAGS to the PandoraSDK ExternalProject, so
  # -Wno-error here lands after -Werror and disables it (gcc15 -Wparentheses).
  cmake "${SOURCEDIR}" \
    -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="-Wno-error"
}
function PostInstall() {
  # Downstream Pandora packages need $PANDORAPFA_ROOT/cmakemodules (include
  # PandoraCMakeSettings), which PandoraPFA's cmake install doesn't ship; install
  # them explicitly (mirrors lcgcmake's copy_directory cmakemodules).
  [ -d "${SOURCEDIR}/cmakemodules" ] && cp -r "${SOURCEDIR}/cmakemodules" "${INSTALLROOT}/cmakemodules"
  return 0
}
