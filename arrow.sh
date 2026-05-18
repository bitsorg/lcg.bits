package: arrow
description: Apache Arrow cross-language columnar in-memory data format
version: "23.0.1"
tag: "23.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/apache-arrow-23.0.1.tar.gz
requires:
  - Boost
  - Python
  - numpy
  - flatbuffers
  - thrift
  - brotli
  - double_conversion
  - glog
  - gflags
  - rapidjson
  - lz4
  - snappy
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
  cmake "$SOURCEDIR/cpp" \
    -G Ninja \
    -DARROW_DEPENDENCY_SOURCE=SYSTEM \
    -DBUILD_SHARED_LIBS=TRUE \
    -DARROW_BUILD_BENCHMARKS=OFF \
    -DARROW_BUILD_TESTS=OFF \
    ${BOOST_ROOT:+-DBOOST_ROOT=$BOOST_ROOT} \
    ${PYTHON_ROOT:+-DPYTHON_EXECUTABLE=$PYTHON_ROOT/bin/python3} \
    ${FLATBUFFERS_ROOT:+-DFlatbuffers_ROOT=$FLATBUFFERS_ROOT} \
    ${RAPIDJSON_ROOT:+-DRapidJSON_ROOT=$RAPIDJSON_ROOT} \
    ${LZ4_ROOT:+-DLZ4_ROOT=$LZ4_ROOT} \
    ${SNAPPY_ROOT:+-DSnappy_ROOT=$SNAPPY_ROOT}
}
