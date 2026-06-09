package: rapidsim
description: RapidSim fast Monte Carlo simulation for heavy-flavour decays
version: "1.4.4"
tag: "1.4.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/RapidSim-1.4.4.tar.gz
requires:
  - CMake
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
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
  # arm64: RapidSim's CMakeLists hardcodes x86 SIMD flags clang rejects on arm64;
  # strip them (x86 Linux/Intel macOS keep them).
  case "$(uname -m)" in
    arm64 | aarch64)
      bits_file_replace "${SOURCEDIR}/CMakeLists.txt" ' -msse -msse2 -msse3 -m3dnow' '' ;;
  esac
  # macOS: -Werror turns Apple clang's warnings from ROOT v6.40 headers fatal;
  # drop it so dependency-header warnings don't break the build.
  bits_is_macos && bits_strip_token "${SOURCEDIR}/CMakeLists.txt" -Werror
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DROOTSYS="${ROOT_ROOT}"
}
