package: compilebox
description: Compilebox online compiler sandbox service
version: "08.11"
tag: "08.11"
sources:
  # The hosted tarball is named by the LCG "author" tag (ATLASOTF-08-11), not the
  # bare version (lcgcmake: author=ATLASOTF-08-11).
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/compilebox-ATLASOTF-08-11.tar.gz
requires:
  - CMake
  - GSL
  - looptools
  - chaplin
  - cln
  - fastjet
  - ggvvamp
  - lhapdf
  - nlox
  - openloops
  - photoscpp
  - pythia8
  - qqvvamp
  - recola
  # Listed explicitly (not just transitively via recola) because the process
  # sub-builds read RECOLASM_*_ROOT_DIR from these packages' roots.
  - recola_SM
  - recola_SM_ATGC_WARSAW
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# Each process is a nested ExternalProject, i.e. a separate cmake run that inherits
# the environment but not the outer cache — so these must be env vars, not -D flags
# (lcgcmake sets the same three via LCGPackage_Add ENVIRONMENT).
export PHOTOSPP_ROOT_DIR="${PHOTOSCPP_ROOT}"
export RECOLASM_ROOT_DIR="${RECOLA_SM_ROOT}"
export RECOLASM_ATGC_WARSAW_ROOT_DIR="${RECOLA_SM_ATGC_WARSAW_ROOT}"
##############################
function Configure() {
  # No-op: the tarball has no top-level CMakeLists.txt (the project lives in
  # COMPILEBOX/), and Make() below runs its own cmake once the process tarball is
  # unpacked. The inherited CMakeRecipe Configure would just fail on src/.
  true
}
function Make() {
  # Extracts process tarballs and writes generated sources back, so operate on the
  # private rsync'd copy ($PWD), never read-only SOURCES. gen_url is the LCG
  # MCGenerators mirror; author=ATLASOTF-08-11 (the LCG author tag).
  local gen_url="https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles"
  local author="ATLASOTF-08-11"
  # curl, not wget: the builder images ship curl (alpgen's Prepare relies on it)
  # but do not guarantee wget.
  curl -fSLO "${gen_url}/compilebox-processes-${author}.tar.gz" \
  && tar xvf "compilebox-processes-${author}.tar.gz" -C "$PWD/COMPILEBOX/" \
  && cmake -DCMAKE_BUILD_TYPE=Release -DLOCAL_SOURCE="$PWD/COMPILEBOX/compilebox-processes-${author}" -DCMAKE_INSTALL_PREFIX="$INSTALLROOT" -DDESTINATION="$PWD/COMPILEBOX_PROCESSES/" -DCMAKE_CXX_STANDARD=17 "$PWD/COMPILEBOX" \
  && cp "$PWD/COMPILEBOX_PROCESSES/POWHEG-BOX-V2/zlibdummy.c" "$PWD/COMPILEBOX_PROCESSES/POWHEG-BOX-RES/zlibdummy.c"
  make ${JOBS:+-j $JOBS}
  make install
}
function MakeInstall() { true; }  # install folded into Make()
