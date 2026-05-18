package: Boost
description: Boost C++ portable peer-reviewed libraries
version: "1.90.0"
tag: "1.90.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/boost_1_90_0.tar.gz
requires:
  - zlib
  - xz
  - bzip2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSL-1.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  rsync -a --delete --exclude '**/.git' "$SOURCEDIR"/ .
  case $(uname) in
    Darwin) TOOLSET=clang ;;
    *) TOOLSET=gcc ;;
  esac
  ./bootstrap.sh --with-toolset=$TOOLSET
  ./b2 --prefix="$INSTALLROOT" toolset=$TOOLSET ${JOBS:+-j$JOBS} install
}
function MakeInstall() {
  true
}
