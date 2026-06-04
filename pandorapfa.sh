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
  # PandoraSDK's headers, and Pandora's cmake settings force -Werror, making them
  # fatal. Strip -Werror (and any -Werror=... token) from the bundled cmake files
  # so the warnings stay warnings. Idempotent; re-running on an already-stripped
  # tree is a no-op.
  grep -rlZ -- '-Werror' "${SOURCEDIR}" 2>/dev/null \
    | xargs -0 -r sed -i 's/-Werror[^ "]*//g' 2>/dev/null || true
  cmake "${SOURCEDIR}" \
    -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
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
