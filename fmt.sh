package: fmt
description: Modern C++ string formatting library ({fmt})
version: "10.2.1"
tag: "10.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib --cmake --root-inc"
##############################
function Configure() {
  # macOS: fmt 10.2.1's tests specialize std::is_floating_point, which current
  # libc++ rejects as a hard error. The library itself is fine, so disable the
  # (unneeded) test build on Darwin.
  _fmt_test=""
  bits_is_macos && _fmt_test="-DFMT_TEST=OFF"
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    ${_fmt_test} \
    -DBUILD_SHARED_LIBS=TRUE
}
