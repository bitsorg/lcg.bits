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
  # gcc15 emits new -Wparentheses warnings (assignment used as truth value) in
  # PandoraSDK's sources, and PandoraSDK's CMakeLists forces -Werror via
  #   set(CMAKE_CXX_FLAGS "-Wall ... -Werror ... -std=c++17 ${CMAKE_CXX_FLAGS}")
  # appending the incoming flags last. PandoraPFA's superbuild forwards
  # CMAKE_CXX_FLAGS to the PandoraSDK ExternalProject, so passing -Wno-error here
  # lands after -Werror and disables it -- the same pattern the standalone
  # pandorasdk / lccontent / larcontent recipes already use. (Seding the source
  # doesn't work: the superbuild extracts PandoraSDK at build time, after
  # Configure.)
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
    -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="-Wno-error" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"}
}
function PostInstall() {
  # Downstream Pandora packages (pandorasdk, pandoramonitoring, lccontent, …)
  # set CMAKE_MODULE_PATH=$PANDORAPFA_ROOT/cmakemodules and do
  # include(PandoraCMakeSettings) / PANDORA_GENERATE_PACKAGE_CONFIGURATION_FILES.
  # PandoraPFA's own cmake install does not ship these modules, so install them
  # explicitly (mirrors lcgcmake's copy_directory cmakemodules).
  [ -d "${SOURCEDIR}/cmakemodules" ] && cp -r "${SOURCEDIR}/cmakemodules" "${INSTALLROOT}/cmakemodules"
  return 0
}
