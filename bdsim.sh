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
  # From a tarball, bdsim's copy_examples_no_git() uses an ADD_CUSTOM_COMMAND that
  # CMake >= 3.28 rejects (not relaxed by CMAKE_POLICY_VERSION_MINIMUM). We don't
  # need the examples (BUILD_TESTING=OFF), so neutralise the copy_examples calls.
  perl -i -pe 's/^[[:space:]]*copy_examples(_no_git)?\(\)/  message(STATUS "bits: examples copy skipped")/' \
    "${SOURCEDIR}/CMakeLists.txt"
  # macOS: find_package(BISON 2.4) picks system /usr/bin/bison (Apple's 2.3);
  # point it at the bits bison 3.8.2 ("bison:osx"). flex has no version floor.
  local _bison=()
  bits_is_macos && _bison+=(-DBISON_EXECUTABLE="${BISON_ROOT}/bin/bison")
  # macOS: with USE_BOOST off, empty BDSBH4DLinkDef.hh is still globbed into
  # BDSBH4DDict, which rootcling rejects. Enabling USE_BOOST forces C++14 vs ROOT
  # 6.40's C++17, so instead drop BDSBH4DLinkDef.hh from the LinkDef glob.
  if bits_is_macos && ! grep -q 'REMOVE_ITEM linkHeaders' "${SOURCEDIR}/cmake/ROOT.cmake"; then
    perl -i -pe 's{^(\s*file\(GLOB linkHeaders .*)$}{$1\nif(NOT USE_BOOST)\n  list(REMOVE_ITEM linkHeaders \${CMAKE_CURRENT_SOURCE_DIR}/include/BDSBH4DLinkDef.hh)\nendif()}' "${SOURCEDIR}/cmake/ROOT.cmake"
  fi
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    "${_bison[@]}"
}
