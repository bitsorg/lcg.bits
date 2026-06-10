package: CMake
description: Cross-platform build system generator
version: "3.30.6"
tag: "3.30.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cmake-3.30.6.tar.gz
requires:
  - OpenSSL
prefer_system: osx.*
prefer_system_check: |
  verge() { [[  "$1" = "$(echo -e "$1\n$2" | sort -V | head -n1)" ]]; }
  verle() { [[  "$1" = "$(echo -e "$1\n$2" | sort -V -r | head -n1)" ]]; }
  current_version=$(cmake --version | sed -e 's/.* //' | cut -d. -f1,2,3)
  echo alibuild_system_replace: cmake"$current_version"
  type cmake && verge 3.28.1 $current_version && verle 3.99.99 $current_version

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
# CMake builds out-of-source, but CMakeRecipe.Prepare() copies the source into
# build/, whose leftover build/Source/ headers collide (#pragma once on file
# identity) with the real ones. Override Prepare to a no-op to keep build/ clean.
function Prepare() { true; }
