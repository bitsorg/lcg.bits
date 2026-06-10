package: hepmcanalysis
description: HepMCAnalysis generator-level analysis tools using HepMC
version: "3.4.14"
tag: "3.4.14"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/HepMCAnalysis-00-03-04-14.tgz
requires:
  - CMake
  - HepMC
  - fastjet
  - ROOT
  - clhep
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
patches:
  - hepmcanalysis-3.4.14.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Prepare() {
  # hepmcanalysis is a plain Makefile project — rsync source into the build dir
  # so that 'make' runs in the correct directory and build outputs land here.
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}/" ./
}
function Configure() {
  : # no-op — hepmcanalysis uses a plain Makefile, not cmake
}
function Make() {
  # config.mk forces -ansi (C++98); ROOT 6.36 headers need C++17. Override
  # CXXFLAGS on the command line (beats config.mk's plain assignment), swapping
  # -ansi for -std=c++17 and keeping the project's other flags.
  make ${JOBS:+-j $JOBS} \
    CXXFLAGS="-pthread -pipe -std=c++17 -fPIC -W -Wall -Wno-deprecated -Wno-empty-body" \
    HepMCdir="${HEPMC_ROOT}" \
    FastJetdir="${FASTJET_ROOT}" \
    ROOTSYS="${ROOT_ROOT}" \
    CLHEPdir="${CLHEP_ROOT}" \
    LIBRARY_PATH="${CLHEP_ROOT}/lib:${FASTJET_ROOT}/lib${LIBRARY_PATH:+:${LIBRARY_PATH}}"
  cmake -E copy_directory ./lib "${INSTALLROOT}/lib"
  cmake -E copy_directory ./include "${INSTALLROOT}/include"
}
function MakeInstall() {
  : # no-op — Make() already copies lib/ and include/ to INSTALLROOT.
  # (CMakeRecipe's Run() calls MakeInstall, not Install; the base MakeInstall
  # runs `cmake --install .`, which fails here since this is a plain Makefile
  # project with no cmake_install.cmake.)
}