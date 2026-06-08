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
  perl -i -pe 's/^[[:space:]]*copy_examples(_no_git)?\(\)/  message(STATUS "bits: examples copy skipped")/' \
    "${SOURCEDIR}/CMakeLists.txt"
  # macOS: the parser needs bison >= 2.4 (find_package(BISON 2.4)), but the system
  # bison at /usr/bin/bison is 2.3 (Apple's), which CMake finds first. Point CMake
  # at Homebrew's keg-only bison (3.8). flex has no version requirement, so the
  # system flex is fine. On Linux the system bison is recent enough; unchanged.
  local _bison=()
  if [ "$(uname)" = Darwin ]; then
    local _bison_exe; _bison_exe="$(brew --prefix bison 2>/dev/null)/bin/bison"
    if [ ! -x "$_bison_exe" ]; then
      echo "bdsim: bison >= 2.4 required; macOS system bison is 2.3." >&2
      echo "bdsim:   brew install bison   (or: brew bundle --file lcg.bits/macos/Brewfile)" >&2
      exit 1
    fi
    _bison+=(-DBISON_EXECUTABLE="$_bison_exe")
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
