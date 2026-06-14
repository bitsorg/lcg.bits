package: mlpack
description: mlpack fast and flexible C++ machine learning library
version: "4.6.2"
tag: "4.6.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - armadillo
  - cereal
  - ensmallen
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: clang makes -Wmissing-template-arg-list-after-template-kw a default
  # error, firing inside cereal 1.3.2 headers. Disable that one diagnostic.
  local _cxxflags=()
  bits_is_macos && _cxxflags+=(-DCMAKE_CXX_FLAGS="-Wno-missing-template-arg-list-after-template-kw")
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTS=OFF \
    "${_cxxflags[@]}"
}
