package: bdsim
description: Beam Delivery Simulation toolkit based on Geant4
version: "1.7.8-rc1"
tag: "1.7.8-rc1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - Geant4
  - ROOT
  - clhep
  - yacc-like
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
patches:
  - bdsim-1.7.8-rc1.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Mirror lcgcmake's bdsim build (BUILD_TESTING=OFF, standard args). The
  # example-copy macro (bdsim_macros.cmake -> ADD_CUSTOM_COMMAND) trips CMake
  # 3.28+'s stricter custom-command policy, so set the policy floor to restore
  # the old behaviour. Sphinx is optional (docs) and only warns.
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
}
