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
function Make() {
  # This recipe extracts process tarballs and writes generated sources back into
  # the tree, so it must operate on the private rsync'd copy (cwd, $PWD), never
  # the shared read-only SOURCES tree. The default CMakeRecipe Prepare has already
  # copied the source here.
  # Translate the lcgcmake macros that were copied in verbatim:
  #   ${gen_url}                      -> the LCG MCGenerators source mirror
  #   <compilebox_08.11_author>       -> ATLASOTF-08-11 (the LCG author tag)
  local gen_url="https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles"
  local author="ATLASOTF-08-11"
  wget "${gen_url}/compilebox-processes-${author}.tar.gz" \
  && tar xvf "compilebox-processes-${author}.tar.gz" -C "$PWD/COMPILEBOX/" \
  && cmake -DCMAKE_BUILD_TYPE=Release -DLOCAL_SOURCE="$PWD/COMPILEBOX/compilebox-processes-${author}" -DCMAKE_INSTALL_PREFIX="$INSTALLROOT" -DDESTINATION="$PWD/COMPILEBOX_PROCESSES/" -DCMAKE_CXX_STANDARD=17 "$PWD/COMPILEBOX" \
  && cp "$PWD/COMPILEBOX_PROCESSES/POWHEG-BOX-V2/zlibdummy.c" "$PWD/COMPILEBOX_PROCESSES/POWHEG-BOX-RES/zlibdummy.c"
  make ${JOBS:+-j $JOBS}
  make install
}
function MakeInstall() { true; }  # install folded into Make()
