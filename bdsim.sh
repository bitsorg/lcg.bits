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
  # bdsim copies its examples into the build tree at configure time. Built from a
  # tarball (no .git) it calls copy_examples_no_git(), whose ADD_CUSTOM_COMMAND
  # (bdsim_macros.cmake) is rejected by CMake >= 3.28 and aborts configure
  # (CMAKE_POLICY_VERSION_MINIMUM=3.5 does not relax it). We don't need the
  # examples (BUILD_TESTING=OFF), so neutralise the copy_examples[/_no_git] calls
  # in the source CMakeLists before configuring. (Sphinx is optional; only warns.)
  sed -i -E 's/^[[:space:]]*copy_examples(_no_git)?\(\)/  message(STATUS "bits: examples copy skipped")/' \
    "${SOURCEDIR}/CMakeLists.txt"
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
}
