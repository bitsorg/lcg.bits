package: protobuf
description: Google Protocol Buffers serialization library
version: "5.28.3"
mem_per_job: 1500
tag: "5.28.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/protobuf-all-5.28.3.tar.gz
requires:
  - CMake
  - Python
  - absl
  - zlib
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
patches:
  - protobuf-5.28.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -Dprotobuf_BUILD_SHARED_LIBS=OFF \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -Dprotobuf_BUILD_TESTS=OFF \
    -DCMAKE_CXX_STANDARD=17 \
    -DABSL_PROPAGATE_CXX_STD=ON \
    -Dprotobuf_ABSL_PROVIDER=package \
    -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=ON \
    ${ABSL_ROOT:+-Dabsl_ROOT="$ABSL_ROOT"}
}
# protoc links Abseil as SHARED libs, but bits' macOS relocation only rewrites a
# package's own rpaths — it never adds an rpath to a *dependency* package's lib
# dir, and DYLD_LIBRARY_PATH is unset during builds. So the installed protoc
# could not load @rpath/libabsl_*.dylib (it aborts with SIGABRT, which broke
# ROOT's TMVA-SOFIE protoc step). CMAKE_INSTALL_RPATH_USE_LINK_PATH bakes the
# linked libraries' dirs (incl. absl's lib) into the install rpath so protoc
# finds Abseil without DYLD_LIBRARY_PATH.
