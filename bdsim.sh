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
  # macOS: parser needs bison >= 2.4 but system bison is Apple's 2.3; pull in bits bison on macOS only
  - "bison:osx"
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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # Neutralise copy_examples[/_no_git]() in CMakeLists: its ADD_CUSTOM_COMMAND is rejected by CMake >= 3.28
  # macOS: BSD sed -i needs a suffix arg, so use perl -i there; Linux keeps sed
  if bits_is_macos; then
    perl -i -pe 's/^[[:space:]]*copy_examples(_no_git)?\(\)/  message(STATUS "bits: examples copy skipped")/' \
      "${SOURCEDIR}/CMakeLists.txt"
  else
    sed -i -E 's/^[[:space:]]*copy_examples(_no_git)?\(\)/  message(STATUS "bits: examples copy skipped")/' \
      "${SOURCEDIR}/CMakeLists.txt"
  fi
  # macOS: point find_package(BISON) at bits bison 3.8.2, not system /usr/bin/bison (Apple's 2.3)
  local _bison=()
  bits_is_macos && _bison+=(-DBISON_EXECUTABLE="${BISON_ROOT}/bin/bison")
  # macOS: drop empty BDSBH4DLinkDef.hh from the LinkDef glob (rootcling rejects it when USE_BOOST is off)
  if bits_is_macos && ! grep -q 'REMOVE_ITEM linkHeaders' "${SOURCEDIR}/cmake/ROOT.cmake"; then
    perl -i -pe 's{^(\s*file\(GLOB linkHeaders .*)$}{$1\nif(NOT USE_BOOST)\n  list(REMOVE_ITEM linkHeaders \${CMAKE_CURRENT_SOURCE_DIR}/include/BDSBH4DLinkDef.hh)\nendif()}' "${SOURCEDIR}/cmake/ROOT.cmake"
  fi
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    "${_bison[@]}"
}
