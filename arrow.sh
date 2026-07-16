package: arrow
description: Apache Arrow cross-language columnar in-memory data format
version: "23.0.1"
# git build disabled: needs submodule/monorepo (or non-git SCM) handling in the build body first.
# source: https://github.com/apache/arrow
# tag: "apache-arrow-%(version)s"
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
  # Configure() forces `-G Ninja` but the builder image lacks ninja, so depend on
  # the ninja recipe to put the generator on PATH (else CMake can't find Ninja).
  - ninja
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: arrow's merged-static-lib step verifies libtool by matching
  # "cctools-<ver>" in `libtool -V`, which recent /usr/bin/libtool no longer emits.
  # Wrap Apple libtool to answer -V with a cctools version, forwarding -static etc.
  local _extra=()
  if bits_is_macos; then
    local _applelt; _applelt=$(xcrun -f libtool 2>/dev/null || echo /usr/bin/libtool)
    local _wrap="${PWD}/.apple-libtool-wrapper"
    cat > "$_wrap" <<EOF
#!/bin/bash
if [ "\$1" = "-V" ]; then
  out=\$("$_applelt" -V 2>&1)
  case "\$out" in
    *cctools-[0-9]*) printf '%s\n' "\$out" ;;
    *) echo "Apple Inc. version cctools-1024.0" ;;
  esac
  exit 0
fi
exec "$_applelt" "\$@"
EOF
    chmod +x "$_wrap"
    _extra+=(-DCMAKE_LIBTOOL="$_wrap")
  fi
  cmake -S "$BITS_CMAKE_SRC/cpp" -B "$BITS_CMAKE_BUILD" \
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
