package: pandorapfa
description: PandoraPFA particle flow algorithm for calorimeter reconstruction
version: "04.11.02"
source: https://github.com/PandoraPFA/PandoraPFA
tag: "v%(version)s"
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
  # PandoraSDK's CMakeLists forces -Werror; the superbuild forwards CMAKE_CXX_FLAGS to
  # its ExternalProject, so -Wno-error here lands after -Werror and disables it (needed
  # for gcc15's new -Wparentheses). Seding the source fails: it's extracted at build time.
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
    -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="-Wno-error" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"}
}
function PostInstall() {
  # Downstream Pandora packages include(PandoraCMakeSettings) from
  # $PANDORAPFA_ROOT/cmakemodules, but PandoraPFA's install omits them; install them
  # explicitly (mirrors lcgcmake's copy_directory cmakemodules).
  [ -d "${SOURCEDIR}/cmakemodules" ] && cp -r "${SOURCEDIR}/cmakemodules" "${INSTALLROOT}/cmakemodules"
  return 0
}
