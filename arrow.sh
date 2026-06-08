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
  # lib) requires Apple's cctools `libtool` and verifies it by matching
  # "cctools-<ver>" in `libtool -V` output. On recent macOS even the genuine
  # /usr/bin/libtool fails that regex (the version string format changed), so the
  # check aborts ("libtool found appears not to be Apple's libtool"). Wrap the
  # real Apple libtool: answer `-V` with a cctools version (passing the real
  # output through if it already contains one), and forward every other call
  # (notably `-static`) to the genuine tool. Linux never hits this branch.
  local _extra=()
  if [ "$(uname)" = Darwin ]; then
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
