package: guinea_pig
description: Guinea Pig beam-beam interaction simulation program
version: "1.2.2"
tag: "1.2.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - fftw
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-GuineaPig
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: gridCPP.h uses the legacy `register` storage-class specifier, which
  # Apple clang rejects as a hard error in C++17 ("ISO C++17 does not allow
  # 'register' ..."), while GCC on Linux only warns. The diagnostic is gated by
  # -Wregister, so -Wno-register lets clang accept the old keyword. Darwin-only
  # to keep the Linux build byte-identical.
  local _cxxflags=()
  bits_is_macos && _cxxflags=(-DCMAKE_CXX_FLAGS="-Wno-register")
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DFFTW3=ON \
    "${_cxxflags[@]}"
}
