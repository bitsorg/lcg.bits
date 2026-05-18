package: google_benchmark
description: Google Benchmark C++ micro-benchmarking library
version: "1.9.5"
tag: "1.9.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/google_benchmark-1.9.5.tar.gz
requires:
  - googletest
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake \
    -DCMAKE_CXX_COMPILER=$CXX \
    -DCMAKE_CXX_FLAGS=$CXXFLAGS \
    -DCMAKE_CXX_STANDARD=17 \
    -DBENCHMARK_ENABLE_GTEST_TESTS=OFF
}
