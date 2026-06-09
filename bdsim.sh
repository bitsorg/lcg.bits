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
  # macOS: the parser needs bison >= 2.4, but the system bison (via yacc-like) is
  # Apple's 2.3. Pull in the bits bison (3.8.2, built from source) on macOS only;
  # Linux's system bison is recent enough and is unchanged.
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
  # bdsim copies its examples into the build tree at configure time. Built from a
  # tarball (no .git) it calls copy_examples_no_git(), whose ADD_CUSTOM_COMMAND
  # (bdsim_macros.cmake) is rejected by CMake >= 3.28 and aborts configure
  # (CMAKE_POLICY_VERSION_MINIMUM=3.5 does not relax it). We don't need the
  # examples (BUILD_TESTING=OFF), so neutralise the copy_examples[/_no_git] calls
  # in the source CMakeLists before configuring. (Sphinx is optional; only warns.)
  perl -i -pe 's/^[[:space:]]*copy_examples(_no_git)?\(\)/  message(STATUS "bits: examples copy skipped")/' \
    "${SOURCEDIR}/CMakeLists.txt"
  # macOS: the parser needs bison >= 2.4 (find_package(BISON 2.4)), but CMake finds
  # the system /usr/bin/bison (Apple's 2.3) first. Point it at the bits bison
  # (3.8.2, pulled in as "bison:osx"). flex has no version requirement, so the
  # system flex is fine. On Linux the system bison is recent enough; unchanged.
  local _bison=()
  bits_is_macos && _bison+=(-DBISON_EXECUTABLE="${BISON_ROOT}/bin/bison")
  # macOS: with USE_BOOST off (the default), BDSBH4DLinkDef.hh is empty (its whole
  # body is #ifdef USE_BOOST), yet ROOT.cmake still globs it and generates
  # BDSBH4DDict — which rootcling (ROOT 6.40) rejects ("No selection rules
  # specified"). Enabling USE_BOOST is not viable (its cmake forces C++14, which
  # conflicts with ROOT 6.40's C++17 requirement). Drop BDSBH4DLinkDef.hh from the
  # LinkDef glob when USE_BOOST is off so the empty dictionary is not generated.
  if bits_is_macos && ! grep -q 'REMOVE_ITEM linkHeaders' "${SOURCEDIR}/cmake/ROOT.cmake"; then
    perl -i -pe 's{^(\s*file\(GLOB linkHeaders .*)$}{$1\nif(NOT USE_BOOST)\n  list(REMOVE_ITEM linkHeaders \${CMAKE_CURRENT_SOURCE_DIR}/include/BDSBH4DLinkDef.hh)\nendif()}' "${SOURCEDIR}/cmake/ROOT.cmake"
  fi
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    "${_bison[@]}"
}
