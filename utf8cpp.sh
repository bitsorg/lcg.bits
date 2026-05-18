package: utf8cpp
description: UTF8-CPP header-only C++ library for UTF-8 string handling
version: "3.2.3"
tag: "3.2.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/utf8cpp-3.2.3.tar.gz
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
function Configure() {
  cmake \
    -DCMAKE_CXX_COMPILER="" \
    -DUTF8_TESTS=OFF
}
