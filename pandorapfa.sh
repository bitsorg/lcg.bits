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
function PostInstall() {
  # Downstream Pandora packages (pandorasdk, pandoramonitoring, lccontent, …)
  # set CMAKE_MODULE_PATH=$PANDORAPFA_ROOT/cmakemodules and do
  # include(PandoraCMakeSettings) / PANDORA_GENERATE_PACKAGE_CONFIGURATION_FILES.
  # PandoraPFA's own cmake install does not ship these modules, so install them
  # explicitly (mirrors lcgcmake's copy_directory cmakemodules).
  [ -d "${SOURCEDIR}/cmakemodules" ] && cp -r "${SOURCEDIR}/cmakemodules" "${INSTALLROOT}/cmakemodules"
  return 0
}
