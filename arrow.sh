package: arrow
description: Apache Arrow cross-language columnar in-memory data format
version: "23.0.1"
tag: "23.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/apache-%(name)s-%(version)s.tar.gz
requires:
  - CMake
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
  # macOS: arrow_create_merged_static_lib (for the bundled-dependencies static
  # lib) requires Apple's cctools `libtool` to merge static archives, and
  # explicitly rejects GNU libtool ("libtool found appears not to be Apple's
  # libtool"). The bits `libtool` package is Homebrew's GNU libtool (aliased as
  # `libtool` on PATH), which collides with that name, so force CMAKE_LIBTOOL to
  # the genuine Apple libtool resolved via xcrun. Linux never hits this branch.
  local _extra=()
  if [ "$(uname)" = Darwin ]; then
    local _applelt; _applelt=$(xcrun -f libtool 2>/dev/null || echo /usr/bin/libtool)
    _extra+=(-DCMAKE_LIBTOOL="$_applelt")
  fi
  cmake "$SOURCEDIR/cpp" \
    -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
    -G Ninja \
    -DARROW_DEPENDENCY_SOURCE=SYSTEM \
    -DBUILD_SHARED_LIBS=TRUE \
    -DARROW_BUILD_BENCHMARKS=OFF \
    -DARROW_BUILD_TESTS=OFF \
    ${BOOST_ROOT:+-DBOOST_ROOT="$BOOST_ROOT"} \
    ${PYTHON_ROOT:+-DPYTHON_EXECUTABLE="$PYTHON_ROOT/bin/python3"} \
    ${FLATBUFFERS_ROOT:+-DFlatbuffers_ROOT="$FLATBUFFERS_ROOT"} \
    ${RAPIDJSON_ROOT:+-DRapidJSON_ROOT="$RAPIDJSON_ROOT"} \
    ${LZ4_ROOT:+-DLZ4_ROOT="$LZ4_ROOT"} \
    ${SNAPPY_ROOT:+-DSnappy_ROOT="$SNAPPY_ROOT"} \
    -Dxsimd_SOURCE="BUNDLED" \
    "${_extra[@]}"
}
